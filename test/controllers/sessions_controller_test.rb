require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @test_user = { name: @user.name, email: @user.email, phone: @user.phone, password: "MyString"}
  end

  test "should get login form" do
    get "/login"
    assert_response :success
  end

  test "should login user" do
    user = User.create(@test_user)
    post "/login" , params: {user: @test_user}
    assert_response :redirect
    assert_equal "login successful", flash[:success]
  end

  test "should not login with invalid credentils" do
    post "/login" , params: {user: {email: "wrong", password: "wrong"}}
    assert_response :redirect
    assert_equal "Invalid email or password", flash[:warning]
  end

  test "should be able to logout" do 
    get "/logout"
    assert_response :redirect
  end
  
end
