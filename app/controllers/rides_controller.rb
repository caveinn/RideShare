class RidesController < ApplicationController
    before_action :set_ride,only: [:request_ride]

    def create
       user.rides.create(ride_params)

    end

    def index
        @rides  = Ride.all
    end

    def request_ride
        @ride.requests.create(user_id: user.id)
        flash[:success] = "request succesful" 
        redirect_to "/rides"
    end


    private
        def set_ride
            @ride = Ride.find(params[:id])
        end

        def ride_params
            params.require(:ride).permit!
        end

        def user
            User.find(session[:user_id])
        end
end

