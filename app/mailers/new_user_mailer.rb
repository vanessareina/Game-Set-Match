class NewUserMailer < ApplicationMailer
  def new_user(user)
    @user = user

    mail(
      to: user.email,
      subject: "Welcome #{user.first_name}!"
    )
  end
end
