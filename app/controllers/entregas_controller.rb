class EntregasController < ApplicationController
  before_filter :get_vendedor

  def index
    @compras = @vendedor.compras
    @cantidad_total_compras = 0
    @saldo = 0
    @compras.each do |compra|
      @cantidad_total_compras += compra.cantidad
      @saldo += compra.saldo_vendedor
    end
  end

  def new
    @entrega = Entrega.new
    @entrega.vendedor = @vendedor
    @entrega.revista = Revista.last
  end

  def create
    if params[:entrega].has_key? :pago
      params[:entrega][:pago] = cadena_a_decimal(params[:entrega][:pago])
    end
    @entrega = Entrega.new(params[:entrega])
    @entrega.vendedor = @vendedor

    if @entrega.save
      redirect_to vendedor_entregas_url(@vendedor)
    else
      render :action => "new"
    end
  end

  def show
    
  end

  private
    def get_vendedor
      @vendedor = Vendedor.find(params[:vendedor_id])
    end
end