class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            flash[:sucess] = "succesfully created the user #{user.name}"
            redirect_to "/signup"
        else
            flash[:warnig] = "failure in registering. Confirm your information"
            redirect_to "/signup"
        end
    end

    private 
        def user_params
            params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
        end 
end