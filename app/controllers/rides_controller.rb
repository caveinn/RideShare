class RidesController < ApplicationController
    before_action :set_ride,only: [:request_ride, :offer_to_request ]

    def new
        @ride = Ride.new
    end

    def create_request
       ride = user.rides.create(ride_params)
       request = Request.new(user: user, ride: ride)
       request.save
       redirect_to '/rides'
    end

    def offer_to_request 
        @ride.driver_id = user.id
        @ride.save
        flash[:success] = "ride offered succesfully" 
        redirect_to "/rides" 
    end

    def create_offer
        puts ride_params.inspect
        ride_params["driver_id"] = user.id
        ride = user.rides.create(ride_params)
        puts ride.errors.inspect
        redirect_to "/rides"
    end

    def request_form
        @ride = Ride.new
    end

    def offer_form
        @ride = Ride.new
    end

    def rides_index
        @rides  = Ride.all
    end

    def index 
        @rides = user.rides
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

