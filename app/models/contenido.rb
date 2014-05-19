class Contenido < ActiveRecord::Base
  has_attached_file :imagen, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :imagen, :content_type => /\Aimage\/.*\Z/
  belongs_to  :campana
  default_scope -> { order('created_at DESC') }
  validates   :campana_id,  presence: true
  validates   :status,      presence: true 
end