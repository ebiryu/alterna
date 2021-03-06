class QuestionsController < ApplicationController
  skip_before_filter :require_login, :only => [:index]

	before_action :set_question, only: [:show, :destroy]

	def index
		@questions = Question.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@question = Question.new(User_id: current_user.id)
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to questions_path
		else
			render 'new'
		end
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	def yes
		@question = Question.find(params[:id])
		current_user.answered_questions << @question
		redirect_to @question, notice: "回答しました。"
	end

	def no
		@question = Question.find(params[:id])
		current_user.opposed_questions << @question
		redirect_to @question, notice: "回答しました。"
	end

	private
	def question_params
		params[:question].permit(:title, :User_id)
	end

	def set_question
		@question = Question.find(params[:id])
	end

end
