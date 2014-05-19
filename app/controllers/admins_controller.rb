class AdminsController < ApplicationController
  
  before_action :signed_in_admin, only: [:index, :edit, :update]
  before_action :correct_admin,   only: [:edit, :update]
  before_action :super_admin,     only: [:destroy]
  
  
  def destroy
    Admin.find(params[:id]).destroy
    flash[:success] = "Administrador eliminado."
    redirect_to admins_url
  end
  
  def index
    @admins = Admin.paginate(page: params[:page])
  end
  
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
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "Perfil updated"
      redirect_to @admin
    else
      render 'edit'
    end 
  end
  
  private 
  
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end
  
  #Before filters
  
#  def signed_in_admin
#    unless signed_in?
#      store_location
#      redirect_to signin_url, notice: "Porfavor logeate." unless signed_in?
#    end
#  end
  
  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless current_admin?(@admin)
  end
  
  def super_admin
    redirect_to(root_url) unless current_admin.super_admin?
  end
end