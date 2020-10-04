class LicenseGroupsController < ApplicationController
  def new
    @license_group = LicenseGroup.new()
    # 参照をするときは、常にカレントユーザーの権限があるか確認を！！！
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def create
    @license_group = LicenseGroup.new(license_group_params)
    card = Card.find_by(id: params[:card_id], user_id: current_user.id)
    @license_group[:card_id] = card.id
    if @license_group.save
    else
      render :new
      return
    end

    @license_group.number_of_licenses.times { |i|
      license = License.new()
      license[:license_group_id] = @license_group.id
      license.save!

      hashids = Hashids.new(ENV['SALT_FOR_SERIAL'], 16)
      hash = hashids.encode(license.id)

      license[:serial_code] = hash
      license.save!
    }

    redirect_to card_license_group_download_url(card, @license_group), notice: "カードが作成されました"
  end

  def destroy
    card = Card.find_by(id: params[:card_id], user_id: current_user.id)
    license_group = LicenseGroup.find_by(card_id: card.id, id: params[:id])
    license_group.destroy!
    redirect_to card_url(card)
  end

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
            pdf.bounding_box([x, y], width: 91.mm, height: 55.mm) do
              pdf.image file.path, position: :center, vposition: :center, fit: [91.mm, 55.mm]
              # pdf.stroke_bounds
            end
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

    # disposition: "inline" ブラウザで表示
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
          # QRのsize指定が必要かどうか、読み取れるかどうかは要確認
          qrcode = RQRCode::QRCode.new(url, level: :m)
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

    # disposition: "inline" ブラウザで表示
    send_data pdf.render, filename: "sample.pdf", type: "application/pdf", disposition: "inline"
  end

  private

  def license_group_params
    params.require(:license_group).permit(:number_of_licenses)
  end
end
