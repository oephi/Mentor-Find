class UserMailer < ApplicationMailer
    default from: 'railsapp@test.com'

    def welcome_email
        @user = params[:user]
        @url = "localhost:3000"  #make this dynamic/the domain its on
        mail(to: @user.email, subject: 'My Sweet Email') # mail is a builtin methods, requires 2 args - who we're sending it to, and a subject.
    end
end