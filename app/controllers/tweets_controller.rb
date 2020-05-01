class TweetsController < ApplicationController
  # Tweet.find(params[:id])を@tweet変数に代入
  before_action :set_tweet, only: [:edit, :show]
  #未ログイン時で新規投稿画面に直接アクセスさせない。無限ループを防ぐために必要なアクション、また、詳細ページへはログインする必要がない
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
