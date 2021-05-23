class UsersController < ApplicationController
    before_action :set_user, only:[:destroy, :edit, :update, :show]
    def new
        @user = User.new
    end

    def show
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "welcome to my app #{@user.username},You seccessfull to signed up"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end