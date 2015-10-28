class UsersController < ApplicationController
    before_action :require_login, except: [:index, :new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]

    def index
        @users = []
        @check = false
        @users = User.all.where.not(id: current_user.connections.pluck(:connected_user_id)).where.not(id: Connection.all.where(connected_user_id: current_user.id).pluck(:user_id)).where.not(id: current_user.id)
        render "index"
    end

    def new
        @errors = flash[:errors] || []
        render "new"
    end

    def create
        u = User.new(user_params)
        if u.save
            session[:user_id] = u.id
            session[:email] = u.email
            @user = User.find_by_email(u.email)
            redirect_to "/connections"
        else
            flash[:errors] = u.errors.full_messages
            redirect_to "/sessions"
        end
    end

    def show
        @user = User.find(params[:id])
        render 'show'
    end

    def edit
        @errors = flash[:errors] || []
        @user = User.find(params[:id])
    end

    def update
        u = User.find(params[:id])
        if u.update(user_params)
            session[:user_id] = u.id
            session[:email] = u.email
            redirect_to "/users/#{params[:id]}"
        else
            flash[:errors] = u.errors.full_messages
            redirect_to :back
        end
    end

    def destroy
        User.find(params[:id]).destroy
        session.destroy
        redirect_to "/sessions/new"
        # redirect_to :controller => 'sessions', :action => 'delete'
    end

    private
    def user_params
        u = params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
    end
end
