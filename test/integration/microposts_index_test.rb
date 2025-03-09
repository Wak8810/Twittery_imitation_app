require "test_helper"

class SeeIndex < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:one)
    get root_path
  end
end
class MicropostsIndexTest < SeeIndex
  test "should render All page" do
    assert_template root_path
    get new_micropost_path
    assert_template 'microposts/new'
    get micropost_path(@micropost)
    assert_template 'microposts/show'
    get edit_micropost_path(@micropost)
    assert_template 'microposts/edit'
  end
end
