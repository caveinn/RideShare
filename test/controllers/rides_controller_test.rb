require 'test_helper'

class RidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @test_user = { name: @user.name, email: @user.email, phone: @user.phone, password: "MyString"}
    post "/login", params:{user: @test_user}
    @ride = rides(:one)
    @test_ride = { origin: "MyString", destination: "MyString", time: "2019-06-18 15:23:19", capacity: 1}
  end

  test "should get rides" do

    get "/rides"
    assert_response :success
  end


  test "should get the rides for a prticular user" do 
    get user_rides_path(@user)
    assert_response :success
  end

  test "should be able to request a ride" do 
    get "/rides/#{@ride.id}/request" 
    assert_response :redirect
    assert_equal "request succesful", flash[:success]
  end

end
