require 'rails_helper'

RSpec.describe User, :type => :model do

  # 姓と名とメールがあれば有効な状態であること
  it "is valid with a user_id, name, email and password" do
    user = User.new(
      id: 1,
      name: 'Aaron',
      email: 'tester@example.com',
      password: '1234',
      password_confirmation: '1234'
      )
    expect(user).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = User.new
    user.name = nil
    expect(user).not_to be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      id: 1, name: 'Joe',
      email: 'tester@example.com',
      password: '1234',
      password_confirmation: '1234'
      )
    user = User.new(
      id: 2, name: 'John',
      email: 'tester@example.com',
      password: '1234',
      password_confirmation: '1234'
      )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  # パスワードがなければ無効な状態であること
  it "is invalid with password shorter than 3 words" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end

end
