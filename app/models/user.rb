class User < ActiveRecord::Base

	has_many :questions, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :answered_questions, through: :answers, source: :question

	validates :name, presence: true

	def answerable_for?(question)
	  question && question.author != self && !answers.exists?(question_id: question.id)
	end
end
