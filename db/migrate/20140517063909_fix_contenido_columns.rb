class FixContenidoColumns < ActiveRecord::Migration
  def change
    add_column :contenidos, :provider,      :string
    add_column :contenidos, :category_id,   :integer
    add_column :contenidos, :until,         :datetime
    add_column :contenidos, :status,        :integer
  end
end
