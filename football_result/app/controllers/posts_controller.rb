class PostsController < ApplicationController
  def index
    @data = Post.all

  end

  def show
    @data = Post.find(params[:id])
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
  end



  private

  def params_post
    params.permit(:hometeam, :awayteam, :hr, :ar,:MyMOM, :memo)
  end

  def goindex
    redirect_to "/posts"
  end


end
