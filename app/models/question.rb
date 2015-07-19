class Question < ActiveRecord::Base

	belongs_to :author, class_name: "User", foreign_key: "member_id"
	
	validates :title, presence: true
end
