class FixContentIdContenidos < ActiveRecord::Migration
  def change
    rename_column :campanas, :content_id, :contenido_id
  end
end
