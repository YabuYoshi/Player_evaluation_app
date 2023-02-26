require "test_helper"

class Admin::GameInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_game_information_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_game_information_create_url
    assert_response :success
  end

  test "should get index" do
    get admin_game_information_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_game_information_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_game_information_update_url
    assert_response :success
  end
end
