class PostsController < ApplicationController
  def index
    @data = Post.all

  end

  def show
    @data = Post.find(params[:id])
  end

  def add
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
    @data.update_attributes(post_params)
    goindex
   end

  def destroy
    @data = Post.find(params[:id])
    @data.destroy
    goindex
  end


  private

  def post_params
    params.permit(:hometeam, :awayteam, :hr, :ar,:mymom, :memo, :date)
  end

  def goindex
    redirect_to "/posts"
  end




end