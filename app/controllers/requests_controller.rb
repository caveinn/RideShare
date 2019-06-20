class RequestsController < ApplicationController
    def decline
        request = Request.find(params[:id])
        request.accepted = false
        request.save
        flash[:success] = "Request rejected"
        redirect_to user_rides_path(user_id: session[:user_id])
    end

    def accept
        request = Request.find(params[:id])
        ride = request.ride
        if ride.capacity <= 0
            flash[:warning] = "Unable to accept capacity reached"
            redirect_to user_rides_path(session[:user_id])
            return
        end
        
        request.accepted = true
        ride.capacity -= 1
        ride.save
        request.save
        flash[:success] = "Request accepted"
        redirect_to user_rides_path(user_id: session[:user_id])
    end

    def index
        user = User.find(session[:user_id])
        @requests = user.requests 
    end
end
