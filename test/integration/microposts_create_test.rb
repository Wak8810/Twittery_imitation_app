require "test_helper"

class MicropostsCreateTest < ActionDispatch::IntegrationTest
  
  test "should success create and increase post" do
    assert_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: {content: "aaa"}}
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_select 'div.alert.alert-success',text:"投稿しました"
  end

  test "should failure create when no content" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: {content: "  "}}
    end
    assert_response :unprocessable_entity
    assert_template 'microposts/new'
    assert_select 'div.alert.alert-danger',text:"内容がありません"
  end

  test "should failure create when content is too long" do
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: {content: "a"*141}}
    end
    assert_response :unprocessable_entity
    assert_template 'microposts/new'
    assert_select 'div.alert.alert-danger',text:"140文字を超えています"
  end

end
