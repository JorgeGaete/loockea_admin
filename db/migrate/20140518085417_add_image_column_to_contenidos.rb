class AddImageColumnToContenidos < ActiveRecord::Migration
  def self.up
      add_attachment :contenidos, :imagen
    end

    def self.down
      remove_attachment :contenidos, :imagen
    end
end
