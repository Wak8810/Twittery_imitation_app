require "test_helper"

class MicropostsUpdateTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:one)
  end

  test "should success update" do
    patch micropost_path(@micropost), params:{micropost:{content:"aaa"}}
    assert_redirected_to root_path
    follow_redirect!
    assert_select 'div.alert.alert-success',text:"更新しました"
    assert_select 'p',text:"aaa"
  end

  test "should failure update because no content" do
    patch micropost_path(@micropost), params:{micropost:{content:" "}}
    assert_response :unprocessable_entity
    assert_template 'microposts/edit'
    assert_select 'div.alert.alert-danger',text:"内容がありません"
  end

  test "should failure update because content is too long" do
    patch micropost_path(@micropost), params: { micropost: {content: "a"*141}}
    assert_response :unprocessable_entity
    assert_template 'microposts/edit'
    assert_select 'div.alert.alert-danger',text:"140文字を超えています"
  end
end
