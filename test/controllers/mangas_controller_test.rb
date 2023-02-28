require "test_helper"

class MangasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mangas_new_url
    assert_response :success
  end

  test "should get create" do
    get mangas_create_url
    assert_response :success
  end
end
