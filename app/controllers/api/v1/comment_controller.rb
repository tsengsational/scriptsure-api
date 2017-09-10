class Api::V1::CommentController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    render json: comment
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render json: comment
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: {message: "Comment successfully deleted."}
  end

  private

  def comment_params
    params.require(:comment).permit(:script_id, :commentor_id, :content)
  end
end
