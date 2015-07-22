class User < ActiveRecord::Base
	authenticates_with_sorcery!

	has_many :questions, dependent: :destroy

	has_many :answers, dependent: :destroy  # yesの多対多
	has_many :answered_questions, through: :answers, source: :question

	has_many :oppositions, dependent: :destroy  # noの多対多
	has_many :opposed_questions, through: :oppositions, source: :question

	validates :name, presence: true

	validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	validates :email, uniqueness: true

	def answerable_for?(question)
	  question and question.author != self and \
	  !answers.exists?(question_id: question.id) and !oppositions.exists?(question_id: question.id)
	end
end
