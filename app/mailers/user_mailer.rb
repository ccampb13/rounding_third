class UserMailer < ActionMailer::Base

  def welcome(user)
    @user = user
    @url  = 'http://roundingthird.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Rounding Third')
  end
end
