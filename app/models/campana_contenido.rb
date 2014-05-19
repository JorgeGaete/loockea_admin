class CampanaContenido < ActiveRecord::Base
  
  belongs_to :campana
  belongs_to :contenido
  
end
