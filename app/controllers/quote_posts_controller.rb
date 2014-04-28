class QuotePostsController < ApplicationController
  before_action :set_quote_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]

  # GET /quote_posts
  # GET /quote_posts.json
  def index
    @quote_posts = QuotePost.all
    render layout: 'admin'
  end

  # GET /quote_posts/1
  # GET /quote_posts/1.json
  def show
    render layout: 'admin'
  end

  # GET /quote_posts/new
  def new
    @quote_post = QuotePost.new
    render layout: 'admin'
  end

  # GET /quote_posts/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /quote_posts
  # POST /quote_posts.json
  def create
    @quote_post = QuotePost.new(quote_post_params)

    respond_to do |format|
      if @quote_post.save
        format.html { redirect_to @quote_post, notice: 'Quote post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quote_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @quote_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_posts/1
  # PATCH/PUT /quote_posts/1.json
  def update
    respond_to do |format|
      if @quote_post.update(quote_post_params)
        format.html { redirect_to @quote_post, notice: 'Quote post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quote_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_posts/1
  # DELETE /quote_posts/1.json
  def destroy
    @quote_post.destroy
    respond_to do |format|
      format.html { redirect_to quote_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_post
      @quote_post = QuotePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_post_params
      params.require(:quote_post).permit(:quote, :author)
    end
end
