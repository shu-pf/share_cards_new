class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    redirect_to "https://www.share-cards.com/" if root_url = "https://share-cards.herokuapp.com/"
  end
  def topic
  end
  def use
  end
  def question
  end
  
  def contact
    @contact = Contact.new()
  end

  def contact_confirm
    @contact = Contact.new(contact_params)
    render :contact if @contact.invalid?
  end

  def contact_create
    @contact = Contact.new(contact_params)

    if params[:back].present?
      render :contact
      return
    end

    @contact.save!

    ContactMailer.contact(@contact.title, @contact.email, @contact.content).deliver_now
    
    redirect_to contact_complete_path, notice: "送信されました。"
  end

  def contact_complete
    
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :email, :content)
  end
end
