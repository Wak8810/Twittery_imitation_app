require "test_helper"

class MicropostTest < ActiveSupport::TestCase

  def setup
    @micropost = Micropost.new(content: "aaa")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "content should be present" do
    @micropost.content = "     "
    assert_not @micropost.valid?
  end

  test "content should not be too long" do
    @micropost.content = "a"*141
    assert_not @micropost.valid?
  end
end
