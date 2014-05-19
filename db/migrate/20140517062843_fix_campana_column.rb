class FixCampanaColumn < ActiveRecord::Migration
  def change
    add_column :campanas, :client,        :string
    add_column :campanas, :tipo,          :integer
    add_column :campanas, :goal,          :integer
    add_column :campanas, :status,        :integer
  end
end
