class AdminNavegationController < ApplicationController
  
  #before_action :signed_in_admin, only: [:campanas, :contenidos, :perfiles]
  
  def home
  end

  def help
  end
  
  def campanas
  end
  
  def contenidos
  end
  
  def perfiles
  end
  
  private
  
    def signed_in_admin
      redirect_to signin_url, notice: "Porfavor logeate." unless signed_in?
    end
end
