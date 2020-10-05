class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end
  def topic
  end
  def use
  end
  def question
  end
  def contact
  end
end
