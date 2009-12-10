class RevistasController < ApplicationController
  def index
    @revistas = Revista.all(:order => "numero DESC")
  end

  def new
    @revista = Revista.new
  end

  def create
    @revista = Revista.new(params[:revista])

    if @revista.save
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
  
  def control_stock
    cantidad = params["cantidad"].to_i
    @revista = Revista.find(params[:id])
    @revista.control_stock(cantidad)
    render :text => @revista.stock
  end

  def costo
    cantidad = params["cantidad"].to_i
    @revista = Revista.find(params[:id])
    render :text => (@revista.valor * cantidad).to_s
  end
end
