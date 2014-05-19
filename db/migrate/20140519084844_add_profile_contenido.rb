class AddProfileContenido < ActiveRecord::Migration
  def change
    add_column  :contenidos, :profile_id, :integer
  end
end
