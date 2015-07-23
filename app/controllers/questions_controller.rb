class QuestionsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create]

	before_action :set_question, only: [:show, :destroy]

	def index
		@questions = Question.all
	end

	def show
	end

	def new
		@question = Question.new
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
		User.find(1).answered_questions << @question
		redirect_to @question, notice: "回答しました。"
	end

	def no
		@question = Question.find(params[:id])
		User.find(1).opposed_questions << @question
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
