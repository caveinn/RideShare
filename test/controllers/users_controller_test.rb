require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @test_user = { name: "test_user", email: "test_user@test.com", phone: "0700000001", password: "pass123", password_confirmation: 'pass123'}
  end
  test "should get the user signup  form" do
    get "/signup"
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post "/users",  params: { user: @test_user}
    end
  end

  test "should show user profile" do
    get "/users/#{@user.id}"
    assert_response :success 
  end

  test "should be able to edit user profile" do
    edited_user = @test_user
    edited_user[:name] = "new name"
    patch user_path(@user), params: {user: edited_user}
    assert_response :success
  end
end
