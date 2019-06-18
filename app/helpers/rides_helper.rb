module RidesHelper
    def my_requests
        @my_requests = Request.where(user_id: session[:user_id]).pluck(:ride_id)
    end
end
