class UsersController < ApplicationController
    before_action :set_user,  only: [:show, :update, :edit]
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            flash[:success] = "succesfully created the user #{user.name}"
            redirect_to "/login"
        else
            flash[:warning] = "failure in registering. Confirm your information"
            redirect_to "/signup"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
    end
    private 
        def set_user
            @user = User.find(params[:id])
        end
        def user_params
            params.require(:user).permit(:name, :email, :phone, :password, :password_confirmation)
        end 
end
