
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def home
    @posts = Post.all
    @tags = Tag.all
    @categories = Category.all
    render 'home/index'
  end

  def by_tag
    @posts = Tag.find_by(slug:params[:slug]).posts
    @tags = Tag.all
    render 'home/index'
  end

  def by_category
    @posts = Category.find_by(slug:params[:slug]).posts
    @tags = Tag.all
    @categories = Category.all
    render 'home/index'
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    render layout: 'admin'
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    render layout: 'admin'
  end

  # GET /posts/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        @post.tags.delete_all
        params[:post][:tag_ids].each do |i|
          if i!=""
            @post.tags << Tag.find(i)
          end
        end
        @post.categories.delete_all
        params[:post][:category_ids].each do |i|
          if i!=""
            @post.categories << Category.find(i)
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :date, :text, :post_type_id)
    end
end
