require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @micropost = microposts(:one)
  end

  test "should get new" do
    get new_micropost_path
    assert_template 'microposts/new'
    assert_response :success
  end

  test "should get index" do
    get root_path
    assert_template root_path
    assert_response :success
  end

  test "should get show" do
    get micropost_path(@micropost)
    assert_template 'microposts/show'
    assert_response :success
  end

  test "should get edit" do
    get edit_micropost_path(@micropost)
    assert_template 'microposts/edit'
    assert_response :success
  end

  test "should post create" do
    post microposts_path, params: {micropost: {content: "a"}}
    assert_redirected_to root_path
  end

  test "should post delete" do
    delete micropost_path(@micropost)
    assert_redirected_to root_path
  end

end
