json.array!(@profiles) do |profile|
  json.extract! profile, :sports, :fashion_beauty, :news_current, :art_design, :tecnology, :outdoor_running, :pictures_images, :gossips, :fun_memes, :finance_economics, :business_enterpreneurship, :music, :movies_series_theater, :travel, :to_do_culture
  json.url profile_url(profile, format: :json)
end