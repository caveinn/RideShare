class SessionsController < ApplicationController
    def create
        user = User.find_by_email(user_params[:email])
        if user && user.authenticate(user_params[:password])
            flash[:success] = "login successful"
            session[:user_id] = user.id 
            redirect_to user
        else
            flash[:warning] = "Invalid email or password"
            redirect_to "/login"
        end
    
    end

    def destroy
        session.clear()
        redirect_to "/"
    end

    private 
     def user_params
        params.require(:user).permit(:email, :password)
     end
end
