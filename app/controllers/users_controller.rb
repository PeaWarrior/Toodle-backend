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

  def login
    username = params[:user][:username];
    pass = params[:user][:password];
    user = User.find_by(username: username);
    
    if (user && user.password == pass)
      id = user.id
      response = {
        status: 200,
        id: id,
        username: username
      }
      render json: response
    else
      render json: {error: "Invalid username or password", status: 400}
    end
  end

  def signup
    current_user = User.find_by(username: params[:user][:username])
    if !current_user
      user = User.create(user_params)
      response = {
        status: 200,
        id: user.id,
        username: user.username
      }
      render json: response
    else
      render json: {error: "username is taken", status: 400}
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
