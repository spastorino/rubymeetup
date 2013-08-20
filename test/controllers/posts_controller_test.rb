require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ongoing)
    assert_not_nil assigns(:upcoming)
    assert_not_nil assigns(:this_week)
    assert_not_nil assigns(:picks)
    assert_not_nil assigns(:ranking)
  end
end
