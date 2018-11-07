class MailController < ApplicationController
    def index
        UserMailer.with(user: current_user).welcome.email.deliver_now
    end
end