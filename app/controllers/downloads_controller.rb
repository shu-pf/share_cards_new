class DownloadsController < ApplicationController
  def index
    @licenses = current_user.licenses
  end
end
