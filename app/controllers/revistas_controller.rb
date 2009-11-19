class RevistasController < ApplicationController
  def index
    @revistas = Revista.all
  end

  def new
    @revista = Revista.new
  end

  def create
    @revista = Revista.new(params[:revista])

    if @revista.save!
      redirect_to revistas_path
    else
      render :action => "new"
    end
  end

  def show
    @revista = Revista.find(params[:id])
  end

  def edit
    @revista = Revista.find(params[:id])
  end

  def update
    @revista = Revista.find(params[:id])

    if @revista.update_attributes(params[:revista])
      redirect_to revistas_path
    else
      render :action => "edit"
    end
  end
  
  def sumar_stock
    #anterior_porcentaje = VariacionPorcentajeGestion.porcentaje_actual
    #nuevo_porcentaje = params["porcentaje"].to_f
    #VariacionPorcentajeGestion.set_porcentaje(params["porcentaje"].to_f)
    #Log.log(current_user, :variacion_porcentaje_descuento, nil, nil, "De
#{anterior_porcentaje} a #{nuevo_porcentaje}.")
    cantidad = params["cantidad"].to_i
    @revista = Revista.find(params[:id])
    @revista.sumar_stock(cantidad)
    #render :nothing => true
    render :text => @revista.stock
  end
end
