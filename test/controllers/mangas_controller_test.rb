require "test_helper"

class MangasControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get mangas_edit_url
    assert_response :success
  end

  test "should get update" do
    get mangas_update_url
    assert_response :success
  end
end
