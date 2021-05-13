class TweetsController < ApplicationController
  def index
    tweets = Tweet.all.order(:id)
    render json: tweets
  end

  def create
    tweet = Tweet.new(
      text: params[:text],
      user_id: params[:user_id],
    )
    if tweet.save
      render json: tweet
    else
      render json: { errors: tweet.errors.full_messages }, status: 422
    end
  end

  def show
    tweet = Tweet.find_by(id: params[:id])
    render json: tweet
  end

  def update
    tweet = Tweet.find_by(id: params[:id])
    tweet.text = params[:text] || tweet.text
    tweet.user_id = params[:user_id] || tweet.user_id

    if tweet.save
      render json: tweet
    else
      render json: { errors: tweet.errors.full_messages }, status: 422
    end
  end

  def destroy
    tweet = Tweet.find_by(id: params[:id])
    tweet.destroy
    render json: { message: "Your tweet was deleted but not really since we'll hold onto it forever in our database. :)" }
  end
end
