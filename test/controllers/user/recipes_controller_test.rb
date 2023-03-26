require "test_helper"

class User::RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_recipes_create_url
    assert_response :success
  end

  test "should get show" do
    get user_recipes_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_recipes_edit_url
    assert_response :success
  end

  test "should get index" do
    get user_recipes_index_url
    assert_response :success
  end
end
