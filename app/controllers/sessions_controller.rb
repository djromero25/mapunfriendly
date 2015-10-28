class SessionsController < ApplicationController
    def index
        @errors = flash[:errors] || []
        render "index"
    end

    def create
        u = User.find_by(email: params[:email])
        if (u && u.authenticate(params[:password]))
            session[:user_id] = u.id
            session[:email] = u.email
            redirect_to "/connections"
        else
            flash[:errors] = ["Invalid Login"]
            redirect_to "/sessions/"
        end
    end

    def delete
        session = nil
        redirect_to "/sessions"
    end

    private
    def user_params
        u = params.require(:user).permit(:email, :password)
    end
end
