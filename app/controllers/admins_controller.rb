class AdminsController < ApplicationController
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      sign_in @admin
      flash[:success] = "Bienvenido al sistema de administracion!"
      redirect_to @admin
    else
      render 'new'
    end
  end
  
  def show
    @admin = Admin.find(params[:id])
  end
  
  private 
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end