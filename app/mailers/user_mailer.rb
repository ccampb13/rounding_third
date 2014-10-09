class UserMailer < ActionMailer::Base
  default from: 'ccampb13@gmail.com',
          return_path: 'ccampb13@gmail.com'

  def welcome(user)
    @user = user
    @url  = 'http://roundingthird.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Rounding Third')
  end
end
