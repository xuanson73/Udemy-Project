class SessionsController < ApplicationController

    def new
        
    end

    def 
        @user = User.find(email: params[:session][:email].downcase)
         if @user.login
            flash[:success] = 'you loged to my app'
         else
            render :new
    end

    def Destroy
    end

end
