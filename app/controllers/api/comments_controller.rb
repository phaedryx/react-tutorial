class Api::CommentsController < ApplicationController
  respond_to :json
  def index
    respond_with Comment.all
  end

  def create
    comment = Comment.new(params[:comment])
    comment.save
    respond_with comment
  end
end
