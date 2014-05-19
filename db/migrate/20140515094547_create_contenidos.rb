class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.integer :campana_id
      t.string  :nombre
      t.integer :tipo

      t.timestamps
    end
    add_index :contenidos, [:campana_id, :created_at]
  end
end
