class FixCampanaidColumnToCampanas < ActiveRecord::Migration
  def change
    rename_column :contenidos, :campaign_id, :campana_id
  end
end
