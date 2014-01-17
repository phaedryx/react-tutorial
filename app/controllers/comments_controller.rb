class CommentsController < ApplicationController
  respond_to :json

  def index
    respond_with Comment.all
  end

  def show
    respond_with Comment.find(params[:id])
  end

  def create
    respond_with Comment.create(comment_params)
  end

private
  def comment_params
    params.require(:comment).permit(:content, :author)
  end
end
