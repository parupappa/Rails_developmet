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
    @data.home_emblem = hm
    @data.away_emblem = am
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
    png_path ="/Users/yokooannosuke/Cording/Rails_developmet/football_result/app/assets/images/*.png"
    array = []
    Dir.glob(png_path).each do |em|
      array.push(em)
    end
    hometeam_emblem = Rails.root+"/app/assets/images/" + @data.hometeam + ".png"
    awayteam_emblem = Rails.root+"/app/assets/images/" + @data.awayteam + ".png"
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
