class PostTypesController < ApplicationController
  def new
    @post_type = PostType.new
    render layout: 'admin'
  end
  def create
    @post_type = PostType.new(post_params)

    respond_to do |format|
      if @post_type.save
        format.html { redirect_to '/', notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def post_params
      params.require(:post_type).permit(:name, :image)
    end
end
