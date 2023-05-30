class UserMailer < ApplicationMailer
    def email_conformation
        @email = params[:email]
        @url = "http://example.com/login"
        mail(to: @email, subject: "welcome to my Awesome Site")
    end

end
