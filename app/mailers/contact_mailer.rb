class ContactMailer < ApplicationMailer
  def contact(title, email, content)
    @title = title
    @email = email
    @content = content

    mail(
      subject: "お問い合わせ",
      to: "shugoena@gmail.com",
      from: 'no-reply@share-cards.com'
    )
  end
end
