class LicenseGroupsController < ApplicationController
  def download
    @card = Card.find(params[:card_id])
    @license_group = LicenseGroup.find(params[:license_group_id])
  end
  def download2
    pdf = RecordPdf.new()

    send_data pdf.render, filename: "sample.pdf", type: "application/pdf", disposition: "inline" # 画面に表示。外すとダウンロードされる。
  end
end
