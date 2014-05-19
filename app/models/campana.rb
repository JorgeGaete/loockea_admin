class Campana < ActiveRecord::Base

  #has_many    :campana_contenidos#, dependent: :destroy
  has_many    :contenidos#, :through => :campana_contenidos
  
  def campanas_dropdown
    "#{self.name}"
  end
  
end
