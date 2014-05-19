class FixContenidosIdToCampanaContenidos < ActiveRecord::Migration
  def change
    change_column :campana_contenidos, :contenidos_id,  :integer
  end
end
