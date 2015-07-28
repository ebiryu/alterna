require 'rails_helper'

RSpec.describe Question, :type => :model do
  it "isn't valid without title" do
    question = Question.new
    question.title = nil
    expect(question).not_to be_valid
  end
end
