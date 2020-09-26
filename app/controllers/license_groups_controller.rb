class LicenseGroupsController < ApplicationController
  def download
    @card = Card.find(params[:card_id])
    @license_group = LicenseGroup.find(params[:license_group_id])
  end
  def download2
    pdf = Prawn::Document.new(:page_size => 'A4', :top_margin => 0, :bottom_margin => 0, :left_margin => 0, :right_margin => 0)
    pdf.text "Hello, world!!"
    pdf.fill_rectangle [40-36, 161.5-36], 243.6, 153
    pdf.fill_rectangle [40-36, 329.5-36], 243.6, 153
    pdf.fill_rectangle [40-36, 329.5-36], 243.6, 153
    pdf.fill_rectangle [40-36, 497.5-36], 243.6, 153
    pdf.fill_rectangle [40-36, 665.5-36], 243.6, 153
    pdf.fill_rectangle [40-36, 833.5-36], 243.6, 153

    pdf.fill_rectangle [312.6-36, 161.5-36], 243.6, 153
    pdf.fill_rectangle [312.6-36, 329.5-36], 243.6, 153
    pdf.fill_rectangle [312.6-36, 329.5-36], 243.6, 153
    pdf.fill_rectangle [312.6-36, 497.5-36], 243.6, 153
    pdf.fill_rectangle [312.6-36, 665.5-36], 243.6, 153
    pdf.fill_rectangle [312.6-36, 833.5-36], 243.6, 153
    send_data pdf.render, filename: "sample.pdf", type: "application/pdf", disposition: "inline"
  end
end
