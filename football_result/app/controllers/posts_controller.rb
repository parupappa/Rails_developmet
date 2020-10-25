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


  def output_array
    until_images_path = Rails.root + "/app/assets/images/"
    png_path ="/Users/yokooannosuke/Cording/Rails_developmet/football_result/app/assets/images/*.png"
    array = []
    Dir.glob(png_path).each do |em|
      images_path = File.basename(em)
      array.push(images_path)
    end
    return array
  end

  def output_emblem(a, foo , bar )
    emblem = [nil, nil]
    i,j = 0, 0

    while i < a.length do
      if foo == a[i]
        emblem[0] = foo
        break
      else
        emblem[0] = nil
      end
      i += 1
    end

    while j < a.length do
      if bar == a[j]
        emblem[1] = bar
        break
      else
        emblem[1] = nil
      end
      j += 1
    end
    return emblem[0] ,emblem[1]
  end

  helper_method :output_array
  helper_method :output_emblem




  private

  def params_post
    params.permit(:hometeam, :awayteam, :hr, :ar,:MyMOM, :memo, :date)
  end

  def goindex
    redirect_to "/posts"
  end




end
