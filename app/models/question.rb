class Question < ActiveRecord::Base

	belongs_to :author, class_name: "User", foreign_key: "user_id"
	has_many :answers, dependent: :destroy
	has_many :answerers, through: :answers, source: :user 

	validates :title, presence: true
end
