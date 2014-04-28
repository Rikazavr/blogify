class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :sidebar, only: [:home, :by_tag, :by_category, :show, :search]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  def home
    @posts = Post.paginate(:page => params[:page])
    offset = rand(QuotePost.count)
    @quote_post = QuotePost.first(offset: offset)
    render 'home/index'
  end

  def by_tag
    @posts = Tag.find_by(slug:params[:slug]).posts.paginate(:page => params[:page])
    @tags = Tag.all
    render 'home/index'
  end

  def by_category
    @posts = Category.find_by(slug:params[:slug]).posts.paginate(:page => params[:page])
    render 'home/index'
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    render layout: 'admin'
  end

  def search
    searching = params["q"].downcase
    results = Post.where("LOWER(title) = ?", searching)
    if results.length < 1
      tags = Tag.where("LOWER(name) = ?", searching)
      if tags.length > 0
        results = tags[0].posts
      else
        cats = Category.where("LOWER(name) = ?", searching)
        if cats.length > 0
          results = cats[0].posts
        end
        results = Post.where("LOWER(title) LIKE '%#{searching}%' OR LOWER(text) LIKE '%#{searching}%'")
      end
      
    end
    if results.length == 1
      @post = results[0]
      render 'posts/show'
    else
      @posts = results.paginate(:page => params[:page])
      render 'home/index'
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.view_count = @post.view_count || 0
    @post.view_count = @post.view_count + 1
    @post.save
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
        format.html { render action: 'new', layout: 'admin' }
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
    def sidebar
      @tags = Tag.all
      @categories = Category.all
      @pop = Post.all.order("view_count desc").limit(4)
      @recent_comments = Comment.order("created_at desc").limit(4)

      @tweets = TWITTER_CLIENT.user_timeline[0..2]

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :image, :date, :text, :post_type_id, :preview)
    end
end
