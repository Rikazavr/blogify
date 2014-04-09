class CommentsController < ApplicationController
  def create
    @comment= Comment.new(params.permit(:author, :comment, :post_id))
    if params[:parent_id] != "0"
      @comment.parent = Comment.find(params[:parent_id])
    end
    if @comment.save 
      respond_to do |format|
        format.js
      end
    else
      render js:'alert("error");'
    end
  end
end
