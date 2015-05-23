class BasicMailer < ActionMailer::Base
  default from: "UAWC <no-replay@uawc.com>"
  MAIL = 'admin@uawc.com.com.com'

  def callback(name, email, text)
    @name = name
    @email = email
    @text = text
    mail to: MAIL, subject: "UAWC"
  end
end
