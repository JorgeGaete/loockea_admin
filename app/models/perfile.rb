class Perfile < ActiveRecord::Base
  
  def profiles_dropdown
    "#{self.name}"
  end
end
