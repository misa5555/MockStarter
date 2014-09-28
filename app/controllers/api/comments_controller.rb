class Api::CommentsController < ApplicationController
  def create
    @comments = Comment.new(comment_params)
    if @comments.save
      render json: @comments
    else
      render json: @comments.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { message: 'destroyed!'}
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :project_id, :author_id)
  end
end
