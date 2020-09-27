class CardPdf < Prawn::Document
  require 'prawn/measurement_extensions'
  require "open-uri"

  # recordにモデルなどのデータを渡します
  def initialize()
    # superで初期設定を指定します(ページサイズ、マージン等)
    super(
      page_size: 'A4',
      top_margin: 11.mm,
      bottom_margin: 11.mm,
      left_margin: 14.mm,
      right_margin: 14.mm
    )
    
  end
end