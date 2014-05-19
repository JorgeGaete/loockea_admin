class FixContenidoName < ActiveRecord::Migration
  def change
    rename_column :contenidos, :nombre, :name
    rename_column :contenidos, :campana_id, :campaign_id
  end
end