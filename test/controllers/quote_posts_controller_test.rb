require 'test_helper'

class QuotePostsControllerTest < ActionController::TestCase
  setup do
    @quote_post = quote_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quote_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote_post" do
    assert_difference('QuotePost.count') do
      post :create, quote_post: { author: @quote_post.author, quote: @quote_post.quote }
    end

    assert_redirected_to quote_post_path(assigns(:quote_post))
  end

  test "should show quote_post" do
    get :show, id: @quote_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote_post
    assert_response :success
  end

  test "should update quote_post" do
    patch :update, id: @quote_post, quote_post: { author: @quote_post.author, quote: @quote_post.quote }
    assert_redirected_to quote_post_path(assigns(:quote_post))
  end

  test "should destroy quote_post" do
    assert_difference('QuotePost.count', -1) do
      delete :destroy, id: @quote_post
    end

    assert_redirected_to quote_posts_path
  end
end
