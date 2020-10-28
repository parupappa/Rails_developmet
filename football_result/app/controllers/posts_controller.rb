class PostsController < ApplicationController
  def index
    @data = Post.all

  end

  def show
    @data = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def new
    @data = Post.new
  end

  def create
    @data = Post.new(params_post)
    @data.save
    goindex
  end

  def edit
    @data = Post.find(params[:id])
  end

  def update
    @data = Post.find(params[:id])
    @data.update_attributes(params_post)
    goindex
   end

  def destroy
    @data = Post.find(params[:id])
    @data.destroy
    goindex
  end


  private

  def params_post
    params.permit(:hometeam, :awayteam, :hr, :ar,:MyMOM, :memo, :date)
  end

  def goindex
    redirect_to "/posts"
  end




end
