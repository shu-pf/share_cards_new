class ContentsController < ApplicationController
  def new
    @card = current_user.cards.find(params[:card_id])
    @content = Content.new()
  end

  def create
    @card = current_user.cards.find(params[:card_id])
    @content = Content.new(content_params)
    @content.card_id = @card.id
    if @content.save == false
      render :new
      return
    end
    redirect_to card_url(@card), notice: "コンテンツが追加されました"
  end

  def destroy
    card = current_user.cards.find(params[:card_id])
    content = card.contents.find(params[:id])
    content.destroy!
    redirect_to card_url(card), alert: "削除しました"
  end

  private

  def content_params
    if params[:content]
      params.require(:content).permit(:content)
    else
      # ActiveStrageがからの場合の処理
      # とりあえずなので要修正
      params[:content] = {}
    end
  end
end
