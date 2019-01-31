class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'http://espn.com'
    mail(to:everybody@appacademy.io, subject: 'APP ACADEMY')
    
  end
end
