class LicenseGroupsController < ApplicationController
  def download
    @card = Card.find(params[:card_id])
    @license_group = LicenseGroup.find(params[:license_group_id])
  end
  def download_front
    card = Card.find(params[:card_id])
    license_group = LicenseGroup.find(params[:license_group_id])

    pdf = CardPdf.new()

    card.card_img.open do |file|
      flag = false
      m = 0
      while true
        2.times { |j|
          x = 91.mm * j
          5.times { |i|
            y = 55.mm * (i + 1)
            pdf.image file.path, :at => [x,y], :width => 91.mm, :height => 55.mm
            if i + j*5 + m*10 >= license_group.licenses.count-1
              flag = true
              break
            end
          }
          break if flag
        }
        break if flag
        pdf.start_new_page
        m+=1
      end
    end

    send_data pdf.render, filename: "sample.pdf", type: "application/pdf", disposition: "inline"
  end

  def download_back
    license_group = LicenseGroup.find(params[:license_group_id])

    pdf = CardPdf.new()
    pdf.font "app/assets/fonts/AnonymousPro-Regular.ttf"

    flag = false
    m = 0
    while true
      2.times { |j|
        x = 91.mm * j
        5.times { |i|
          y = 55.mm * (i + 1)

          # 背景の書き込み
          pdf.image open(root_url + 'sharecards_back.png'), :at => [x,y], :width => 91.mm, :height => 55.mm
          # シリアルの書き込み
          serial_code = license_group.licenses[i + j*5 + m*10].serial_code
          serial_code_alt = ""
          serial_code.scan(/.{1,#{4}}/).each_with_index do |s, i|
            if i < 3 
              serial_code_alt += s + '-'
            elsif i >= 3
              serial_code_alt += s
            end
          end
          pdf.draw_text serial_code_alt, :at => [x + (7.2).mm,y - (28.7).mm]
          # QRの生成
          url = root_url + "rgs/" + serial_code
          qrcode = RQRCode::QRCode.new(url, size: 3, level: :m)
          png = qrcode.as_png(size: 75,border_modules: 0)
          image_data=StringIO.new(png.to_s)
          pdf.image image_data, :at => [x + (62).mm, y - (14).mm]
          if i + j*5 + m*10 >= license_group.licenses.count-1
            flag = true
            break
          end
        }
        break if flag
      }
      break if flag
      pdf.start_new_page
      m+=1
    end

    send_data pdf.render, filename: "sample.pdf", type: "application/pdf", disposition: "inline"
  end
end
