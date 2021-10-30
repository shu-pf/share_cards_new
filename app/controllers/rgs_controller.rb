class RgsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:serial_code]
      serial_code =[] 
      params[:serial_code].scan(/.{1,#{4}}/).each_with_index do |s, i|
        serial_code[i] = s
      end
      @serial_tmp = SerialTmp.new(serial_code1: serial_code[0], serial_code2: serial_code[1], serial_code3: serial_code[2], serial_code4: serial_code[3])
    elsif
      @serial_tmp = SerialTmp.new()
    end
  end

  def rgs
    serial_codes = SerialTmp.new(serial_params)
    serial_code = serial_codes.serial_code1 + serial_codes.serial_code2 + serial_codes.serial_code3 + serial_codes.serial_code4
    if current_user
      # ログイン状態の場合
      if License.where(serial_code: serial_code).exists?
        license = License.find_by(serial_code: serial_code)
        if license.user_id?
          redirect_to rgs_url, alert: "既に使用されたコードです"
        else
          # ライセンスの更新処理
          license = License.find_by(serial_code: serial_code)
          license.update(user_id: current_user.id)
          redirect_to downloads_url, notice: "「#{license.license_group.card.title}」を登録しました。詳細ページからダウンロード出来ます。"
        end
      else
        redirect_to rgs_url, alert: "無効なシリアルコードです"
      end
    else
      # ログイン状態でない場合
      if License.where(serial_code: serial_code).exists?
        license = License.find_by(serial_code: serial_code)
        if license.user_id?
          redirect_to rgs_url, alert: "既に使用されたコードです"
        else
          # ライセンスの更新処理
          
          # ダウンロード処理
          @card = license.license_group.card
          @title = @card.title
          @files = @card.musics.map{ |music| [url_for(music.music_mp3), "#{music.track_number}-#{music.title}-#{music.artist_name}.mp3"] }
        end
      else
        redirect_to rgs_url, alert: "無効なシリアルコードです"
      end
    end
  end

  private

  def serial_params
    params.require(:serial_tmp).permit(:serial_code1, :serial_code2, :serial_code3, :serial_code4)
  end
end
