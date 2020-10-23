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
    hm , am = output_emblem()
    puts @data
    @data.home_emblem = hm
    @data.away_emblem = am
    puts @data
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
    params.permit(:hometeam, :awayteam, :hr, :ar,:MyMOM, :memo, :home_emblem, :away_emblem)
  end

  def goindex
    redirect_to "/posts"
  end

  def output_emblem()
    until_images_path = Rails.root + "/app/assets/images/"
    png_path = until_images_path +  "*.png"
    array = []
    Dir.glob(png_path).each do |em|
      images_path = File.basenema(em)
      array.push(images_path)
    end
    hometeam_emblem = @data.hometeam + ".png"
    awayteam_emblem = @data.awayteam + ".png"
    emblem = [nil, nil]
    i,j = 0, 0

    while i < array.length do
      if hometeam_emblem == array[i]
        emblem[0] = hometeam_emblem
        break
      else
        emblem[0] = nil
      end
      i += 1
    end

    while j < array.length do
      if awayteam_emblem == array[j]
        emblem[1] = awayteam_emblem
        break
      else
        emblem[1] = nil
      end
      j += 1
    end

    return emblem[0] ,emblem[1]

  end


end
