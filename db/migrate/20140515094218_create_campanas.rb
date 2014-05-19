class CreateCampanas < ActiveRecord::Migration
  def change
    create_table :campanas do |t|
      t.integer :contenido_id
      t.string :nombre

      t.timestamps
    end
  end
end
