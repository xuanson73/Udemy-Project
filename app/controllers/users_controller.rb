class UsersController < ApplicationController
    before_action :set_user, only:[:destroy, :edit, :update, :show]

    def index
        @users = User.paginate(page: params[:page], per_page: 3)
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @articles = @user.articles.paginate(page: params[:page], per_page: 3)
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

    def destroy
        @user.destroy
        flash[:success] = "User was destroyed"
        redirect_to users_path
    end

    private
    
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end