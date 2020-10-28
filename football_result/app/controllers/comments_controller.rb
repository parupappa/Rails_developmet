class CommentsController < ApplicationController
 def create
    @data = Post.find(params[:post_id])
    @comment = Comment.new(params_comment)
    @comment.post = @data

    if @comment.save
      redirect_to post_url(@data)
    else
      render "posts/show"
    end
  end


 def destroy
    @data = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@data)
  end

  private

  def params_comment
    params.require(:comment).permit(:name, :content)
  end

end

