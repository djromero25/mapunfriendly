class AttendancesController < ApplicationController
    before_action :require_login, except: [:new, :create]
    # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
    def index
        @user = User.find(current_user)
        # @connections = @user.connections.where(status: true)
        # @invitations = @user.connections.where(status: false)
        render "index"
    end

    def create
        c = Connection.new(user: User.find(params[:user_id]), connected_user: User.find(session[:user_id]), status: false)
        if c.save
            redirect_to "/users"
        else
            flash[:errors] = c.errors.full_messages
            redirect_to "/users"
        end
    end

    def update
        c = Connection.find(params[:id])
        c.update(status: true)
        Connection.create(user_id:c.connected_user_id, connected_user_id: c.user_id, status: true)
        redirect_to "/connections"
    end

    def destroy
        c = Connection.find(params[:id])
        c.destroy
        redirect_to "/connections"
    end
end
