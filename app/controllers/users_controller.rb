class UsersController < ApplicationController 
    def new
        @user = User.new
    end
    
    def create
        email = params["user"]["email"]
        user = User.find_by(email: email)
        if user.nil?
            @user = User.new user_params
            if @user.save
                session["user_id"] = @user.id
                UserMailer.with(email: email).email_conformation.deliver_now
                redirect_to root_path
            else 
                render :new
            end
        end    
    end
    def get_auth
        @user = User.new  
    end
    def set_auth
        email = params["email"]
        user = User.find_by(email: email)
        if user.nil?
            redirect_to sign_in_path
        else
            password = params["password"]
            if user.authenticate(password)
                session["user_id"] = user.id
                redirect_to root_path
                
            else
                redirect_to sign_in_path
            end
            
        end

    end

    private 
    def user_params
        params.require(:user).permit(:email, :password, :user_name) 
    end
end

