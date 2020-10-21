class PostsController < ApplicationController
  def index
    @msg = "demo"
    @data = Post.all

  end

  def show
    @data = Post.find(params[:id])
  end

  def new
    @data = Post.new
  end

  def create
    if request.post? then
      @data = Post.create(params_post)
    end
    goindex
  end

  def edit
  end



   private

   def params_post
     params.permit(:hometeam, :awayteam, :hr, :ar)
   end

   def goindex
    redirect_to "/posts"
   end


end
