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
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

   private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
