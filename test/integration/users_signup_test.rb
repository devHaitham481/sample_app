require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

test "should be invalid without a name" do
  user = User.new(name: '')

  assert user.invalid?, name: :blank
end

  # test "invalid signup information" do 
  #   get signup_path 
  #     @user = User.new(name: " ", 
  #                              email: "user@invalid", 
  #                              password: "foo",
  #                              password_confirmation: "bar")
  #     # post users_path(@user)
  #     # assert_response :success
  #     assert user.invalid? 
     
  #     # assert_template 'users/new'
  #   end

    test "invalid signup information" do 
      get signup_path
      assert_no_difference 'User.count' do 
        post users_path, params:{ user: { name: " ",
          email: "user@example",
          password: "pass",
          password_confirmation: "word" }}
        end
        assert_template 'users/new'
      end

    test "valid signup information" do 
    get signup_path
    assert_difference 'User.count', 1 do 
    post users_path, params:{user: { name: "Example User",
                                          email: "user@example.com",
                                          password: "password",
                                          password_confirmation: "password" }}
    follow_redirect!
    end
      assert_template 'users/show'
  end

end
