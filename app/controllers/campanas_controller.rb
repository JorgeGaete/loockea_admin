class CampanasController < ApplicationController
  
  before_action :signed_in_admin, only: [:index, :edit, :update]
  
  def monitor
  end
  
  def edit
    @campana = Campana.find(params[:id])
  end
  
  def update
    @campana = Campana.find(params[:id])
    if @campana.update_attributes(campana_params)
      flash[:success] = "Campana modificada"
      redirect_to @campana
    else
      render 'edit'
    end 
  end
  
  def new
    @campana = Campana.new
  end
  
  def create
    @campana = Campana.new(campana_params)
    if @campana.save
      flash[:success] = "Campana creada!"
      redirect_to @campana
    else
      render 'new'
    end
  end
  
  def index
    @campanas = Campana.paginate(page: params[:page])
  end
  
  def show
    @campana = Campana.find(params[:id])
    @contenidos = @campana.contenidos.paginate(page: params[:page])
  end
  
  private 

  def campana_params
    params.require(:campana).permit(:contenido_id, :name, :client, :tipo, :goal, :status)
    
    
  end
  
#  def signed_in_admin
#    unless signed_in?
#      store_location
#      redirect_to signin_url, notice: "Porfavor logeate." unless signed_in?
#    end
#  end
  
end