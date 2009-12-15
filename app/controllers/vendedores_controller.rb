class VendedoresController < ApplicationController
  def index
    @vendedores = Vendedor.all
  end

  def new
    @vendedor = Vendedor.new
  end

  def create
    @vendedor = Vendedor.new(params[:vendedor])

    if @vendedor.save
      begin
        FileUtils.mv params[:vendedor][:image].path, @vendedor.foto_fullpath
      rescue
      end

      params[:puntos_de_venta].each_pair do |key, punto_de_venta_params|
        punto_de_venta = PuntoDeVenta.new(punto_de_venta_params)
        punto_de_venta.vendedor = @vendedor
        punto_de_venta.inicio = Time.now if @vendedor.puntos_de_venta.blank?
        punto_de_venta.save
        @vendedor.reload
      end
      
      redirect_to new_vendedor_encuesta_url(@vendedor)
    else
      render :action => "new"
    end
  end

  def show
    @vendedor = Vendedor.find(params[:id])
  end

  def update
    # TODO
  end

  def credencial
    @vendedor = Vendedor.find(params[:id])
  end

  def encuesta
    @vendedor = Vendedor.find(params[:id])
  end
end
