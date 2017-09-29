class ResponseMailer < ApplicationMailer
  def new_response(response)
    @response = response

    mail(
      to: response.user.email,
      subject: "You have a response to your post!"
    )
  end
end
