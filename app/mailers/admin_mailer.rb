class AdminMailer < ApplicationMailer
  def allusers(subject, content, email)
    @content = content
    mail(
      subject: subject,
      to: email,
      from: 'no-reply@share-cards.com'
    )
  end
end
