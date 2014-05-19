class CreateCampanaContenidos < ActiveRecord::Migration
  def change
    create_table :campana_contenidos do |t|
      t.integer :campana_id
      t.integer :contenido_id

      t.timestamps
    end
  end
end
