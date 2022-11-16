require 'test_helper'

class CatagoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catagories_index_url
    assert_response :success
  end

end
