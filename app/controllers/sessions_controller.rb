class SessionsController < ApplicationController

    def new    
    end

    def create
        user = User.find_by(email: params[:sessions][:email].downcase)
         if user && user.authenticate(params[:sessions][:password])
           session[:user_id] = user.id
            flash[:success] = 'you loged to my app'
            redirect_to user
         else
            flash.now[:alert] = "you can't login"
            render 'new'
         end
    end

    def destroy
        session[:user_id] = nil
        flash[:alert] = "You are loged out"
        redirect_to root_path
    end

end
