class Question < ActiveRecord::Base

	belongs_to :author, class_name: "User", foreign_key: "user_id"

	has_many :answers, dependent: :destroy  # yesの多対多
	has_many :answerers, through: :answers, source: :user 

	has_many :oppositions, dependent: :destroy  # noの多対多
	has_many :opponents, through: :oppositions, source: :user

	STATUS_VALUES = %w( draft member_only public )

	validates :title, presence: true

	scope :common, -> { where(status: "public") }
	scope :published, -> { where("status <> ?", "draft") }
	scope :full, ->(user) { where("status <> ? OR user_id = ?", "draft", user.id) }
	scope :readable_for, ->(user) { user ? full(user) : common }
end
