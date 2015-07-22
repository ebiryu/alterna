class Opposition < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

  validate do 
    unless user && user.answerable_for?(question)
      errors.add(:base, :invalid)
    end
  end
end
