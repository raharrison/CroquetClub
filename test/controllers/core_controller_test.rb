require 'test_helper'

class CoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about_the_club" do
    get :about_the_club
    assert_response :success
  end

  test "should get how_to_join" do
    get :how_to_join
    assert_response :success
  end

  test "should get what_you_need" do
    get :what_you_need
    assert_response :success
  end

  test "should get programme" do
    get :programme
    assert_response :success
  end

  test "should get news_letters" do
    get :news_letters
    assert_response :success
  end

  test "should get club_matters" do
    get :club_matters
    assert_response :success
  end

  test "should get how_to_get_there" do
    get :how_to_get_there
    assert_response :success
  end

  test "should get book_a_lawn" do
    get :book_a_lawn
    assert_response :success
  end

  test "should get links" do
    get :links
    assert_response :success
  end

end
