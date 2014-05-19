class Campana < ActiveRecord::Base
  has_many  :contenidos, dependent: :destroy
end
