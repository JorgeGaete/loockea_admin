class ChangeCloumnUntilToEndDateInContenidos < ActiveRecord::Migration
  def change
    rename_column :contenidos, :until, :end_date
  end
end
