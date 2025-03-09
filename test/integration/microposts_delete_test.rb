require "test_helper"

class MicropostsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:one)
  end
  test "should success delete" do
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(@micropost)
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_template root_path
    assert_select 'div.alert.alert-success',text:"削除しました"
  end
end
