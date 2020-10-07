class AdminController < ApplicationController
  before_action :if_not_admin

  def index
  end

  def new_mail
  end

  def send_mail
    users = User.all
    users.each do |user|
      AdminMailer.allusers(params[:subject], params[:content], user.email).deliver_now
    end
    redirect_to admin_path, notice: "送信されました"
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
