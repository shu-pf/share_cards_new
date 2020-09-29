class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end

  def new_music
  end

  def show
    # 他の人がアップリしているカードを見れない様にする
    @card = Card.find_by(id: params[:id], user_id: current_user.id)
  end

  def destroy
    card = Card.find_by(id: params[:id], user_id: current_user.id)
    # Todo:関連する物の削除
    card.destroy!
    redirect_to cards_url
  end

  def select
  end

  def new
    @card = Card.new()
    @license_group = LicenseGroup.new()
  end

  def create
    @card = Card.new(card_params)
    @card[:user_id] = current_user.id

    if @card.save
    else
      render :new
      return
    end

    redirect_to new_card_license_group_url(@card), notice: "カードが登録されました"
  end

  private

  def card_params
    params.require(:card).permit(:title, :auther_name, :content, :card_img)
  end
end
