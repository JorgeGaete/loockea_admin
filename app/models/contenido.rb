class Contenido < ActiveRecord::Base
  has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  #has_many    :campana_contenidos#, dependent: :destroy
  belongs_to  :campana
  #has_many    :contenidos, :through => :campana_contenidos
  
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/
  default_scope -> { order('created_at DESC') }
  validates   :campana_id,  presence: true
  validates   :status,      presence: true 
  
  def contenidos_dropdown
    "#{self.name}"
  end
end