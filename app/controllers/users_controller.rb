class UsersController < ApplicationController
    before_action :set_user, only:[:destroy, :edit, :update, :show]

    def index
        @user =User.all
    end
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
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
            flash[:notice]="You seccessfull to update user"
            redirect_to user_path
        else
            render 'edit'
        end
    end

    private
    
    def set_user
      @user = @current_user
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end