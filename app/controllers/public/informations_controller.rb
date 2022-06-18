class Public::InformationsController < Public::ApplicationController
  def index
    gon.latitude = 35.4577205 # 岐阜の緯度
    gon.longitude = 136.793811 # 岐阜の経度
  end

  def search
    # binding.pry
    # GoogleMapの表示領域の座標を取得
    default_sw = info_params[:map_viewport_position_southwest].scan(/[0-9.]+/)
    default_ne = info_params[:map_viewport_position_northeast].scan(/[0-9.]+/)
    latitude_s, longitude_s = default_sw.map { |i| i.to_f }
    latitude_e, longitude_e = default_ne.map { |i| i.to_f }
    # 座標内の投稿を取得(当日かつ有効な投稿のみ)
    @informations = Information.joins(:owner).select("owners.*, information.*").map_view_ports(latitude_s, latitude_e, longitude_s, longitude_e).today_is_valid
    # map.jsファイルにデータを渡す
    gon.informations = @informations
    gon.latitude = info_params[:hidden_lat].to_f
    gon.longitude = info_params[:hidden_lng].to_f
  end

  def info_params
    params.require(:information)
  end
end
