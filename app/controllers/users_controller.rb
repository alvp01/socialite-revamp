class UsersController < ApplicationController
  def index
    @user = current_user
    @timeline_posts = @user.timeline_posts
    @post = Post.new
    @comment = Comment.new
    @user_timeline = @user.who_to_follow
    @group = Group.new
    @groups = Group.all
  end

  def show
    @user = User.find_by_username(params[:username])
    @posts = @user.posts.latest
    @post = Post.new
    @followers = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
