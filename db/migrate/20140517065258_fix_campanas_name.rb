class FixCampanasName < ActiveRecord::Migration
  def change
    rename_column :campanas, :nombre, :name
    rename_column :campanas, :contenido_id, :content_id
  end
end