class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    render json: user, only: [:id, :username]
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user, only: [:id, :username]
  end
  
  def show
    user = User.find(params[:id])
    images = user.images
    user_images = {
      username: user.username,
      password: user.password,
      images: images
    }
    render json: user_images
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user, only: [:id, :username]
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
