class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# redirect_to user_path(@user)
      redirect_to( new_user_session_path, notice: 'User was successfully created. Please login.')
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		redirect_to user_path(@user)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@user.destroy
  	redirect_to users_path
  end

  private
  def user_params
  	# params[:user].permit(:name, :full_name)
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
  	@user = User.find(params[:id])
  end

end
