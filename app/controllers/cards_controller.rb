class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end

  def new
    @card = Card.new()
    @license_group = LicenseGroup.new()
  end

  def create
    @card = Card.new(card_params)
    @card[:user_id] = current_user.id

    @license_group = LicenseGroup.new(license_group_params)

    if @card.save
    else
      render :new
      return
    end

    @license_group[:card_id] = @card.id

    if @license_group.save
    else
      Card.find(@card.id).destroy
      render :new
      return
    end

    license_group.number_of_licenses.times { |i|
      license = License.new()
      license[:license_group_id] = @license_group.id
      license.save!

      hashids = Hashids.new(ENV['SALT_FOR_SERIAL'], 16)
      hash = hashids.encode(license.id)

      license[:serial_code] = hash
      license.save!
    }

    redirect_to card_license_group_download_path(@card, @license_group)
  end

  private

  def card_params
    params.require(:card).permit(:title, :auther_name, :content, :card_img)
  end

  def license_group_params
    params.require(:license_group).permit(:number_of_licenses)
  end
end
