class CardsController < ApplicationController
  before_action :if_not_creator

  def index
    @cards = current_user.cards
  end

  def new_music
  end

  def edit_title
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def edit_auther_name
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def edit_card_img
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def update
    card = Card.find_by(id: params[:id], user_id: current_user.id)
    flag = card.update(card_params)
    if flag
    else
      redirect_to card_url(card), alert: "更新に失敗しました"
      return
    end
    redirect_to card_url(card), notice: "更新しました。"
  end

  def edit
    @card = Card.find_by(id: params[:id], user_id: current_user.id)
  end

  def show
    @card = current_user.cards.find(params[:id])
  end

  def destroy
    card = Card.find_by(id: params[:id], user_id: current_user.id)
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
    case @card.design_type
    when 2 then
      downloaded_image = open(root_url + 'samplecard1.png')
      @card.card_img.attach(io: downloaded_image  , filename: "samplecard1.png")
    end

    if @card.save == false
      render :new
      return
    end

    redirect_to card_url(@card), notice: "作成されました。続いてコンテンツを登録します。"
  end

  private

  def card_params
    if params[:card]
      params.require(:card).permit(:title, :auther_name, :card_img, :design_type, :format, :edge_blank)
    else
      # ActiveStrageがからの場合の処理
      # とりあえずなので要修正
      params[:card] = {title: ""}
    end
  end

  def if_not_creator
    redirect_to edit_user_registration_path, notice: "カードを作成するには、ユーザー詳細よりクリエイターユーザーに変更してください" unless current_user.creator?
  end
end
