class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.binary :sports
      t.binary :fashion_beauty
      t.binary :news_current
      t.binary :art_design
      t.binary :tecnology
      t.binary :outdoor_running
      t.binary :pictures_images
      t.binary :gossips
      t.binary :fun_memes
      t.binary :finance_economics
      t.binary :business_enterpreneurship
      t.binary :music
      t.binary :movies_series_theater
      t.binary :travel
      t.binary :to_do_culture

      t.timestamps
    end
  end
end
