require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:example)
  end

  test "index including pagination" do
    log_in_as(@user)
    get index_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    # User.paginate(page: 1).each do |user|
    #   assert_select 'a[href=?]', "/users/1"
    # end
  end

end
