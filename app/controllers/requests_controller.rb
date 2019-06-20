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
        request.accepted = true
        request.save
        flash[:success] = "Request accepted"
        redirect_to user_rides_path(user_id: session[:user_id])
    end

    def index
        user = User.find(session[:user_id])
        @requests = user.requests 
    end
end
