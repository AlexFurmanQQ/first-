class UsersController < ApplicationController 
    skip_before_action :verify_authenticity_token
    def new
        @user = User.new
    end
    
    def create
        Print.p(params)
        email = params["user"]["email"]
        user = User.find_by(email: email)
        if user.nil?
            @user = User.new user_params
            @user.avatar.attach(params["user"][:avatar])
            if @user.save
                @user.update(code_email_conformation: SecureRandom.hex) 
                session["user_id"] = @user.id
                SentEmailCreateUserJob.perform_now email
                redirect_to root_path
                # render json: {error: false}
            else 
                render :new
            end
        else 
            render json: { error: true, message: "пользователь уже существует" }
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
        params.require(:user).permit(:email, :password, :user_name, :avatar) 
    end
end

