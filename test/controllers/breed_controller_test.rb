require "test_helper"

class BreedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breed_index_url
    assert_response :success
  end

  test "should get show" do
    get breed_show_url
    assert_response :success
  end
end
