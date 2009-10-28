class PromocionesController < ApplicationController
  def index
    @promociones = Promocion.all
  end

  def new
    
  end

  def create

  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  def activar
    promocion = Promocion.find(params[:id])
    promocion.activar
    redirect_to promociones_path
  end
end
