require 'test_helper'

class FavouriteDishControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favourite_dish_index_url
    assert_response :success
  end

end
