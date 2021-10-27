class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user.id)

    render :index




  end

  def show
  end

  def edit
  end

   private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:title, :body)
  end
end
