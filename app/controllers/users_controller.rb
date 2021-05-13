class UsersController < ApplicationController
  def index
    users = User.all.order(:id)
    render json: users
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
    )
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    user.username = params[:username] || user.username
    user.email = params[:email] || user.email

    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    render json: { message: "This user has been completely destroyed." }
  end
end
