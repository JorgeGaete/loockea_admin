class ContenidosController < ApplicationController
  before_action :signed_in_admin, only: [:create, :destroy]
  def new
    @contenido = Contenido.new
  end
  
  def create
    @contenido = Contenido.new(contenido_params)
    if @contenido.save
      flash[:success] = "Bienvenido al sistema de administracion!"
      redirect_to @contenido
    else
      render 'new'
    end
  end
  
  def edit
    @contenido = Contenido.find(params[:id])
    @campanas = Campana.all
    @profiles = Profile.all
  end

  def show
    @contenido = Contenido.find(params[:id])
    #@contenidos = @campana.contenidos.paginate(page: params[:page])
  end

  def index
    @contenidos = Contenido.paginate(page: params[:page])
  end
  
  def update
    @contenido = Contenido.find(params[:id])
    if @contenido.update_attributes(contenido_params)
      flash[:success] = "Contenido modificado"
      redirect_to @contenido
    else
      render 'edit'
    end 
  end
  
  def destroy
    Contenido.find(params[:id]).destroy
    flash[:success] = "Contenido eliminado."
    redirect_to contenidos_url
  end
  
  private 
  
  def contenido_params
    params.require(:contenido).permit(:campana_id, :name, :tipo, :provider, :category_id, :status, :imagen, :profile_id)
  end
  
  def correct_admin
    @admin = Admin.find(params[:id])
    redirect_to(root_url) unless current_admin?(@admin)
  end
  
  def super_admin
    redirect_to(root_url) unless current_admin.super_admin?
  end
   
end
