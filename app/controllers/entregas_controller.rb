class EntregasController < ApplicationController
  before_filter :get_vendedor

  def index
    if request.post?
      @vendedor = Vendedor.find_by_credencial(params["vendedor"]["credencial"])
      redirect_to new_vendedor_entrega_url(@vendedor)
    else
      if @vendedor
        @compras = @vendedor.compras
        @cantidad_total_compras = 0
        @saldo = 0
        @compras.each do |compra|
          @cantidad_total_compras += compra.cantidad
          @saldo += compra.saldo_vendedor
        end
      else
        render :template => "entregas/distribucion"
      end
    end
  end

  def new
    @entrega = Entrega.new
    @entrega.vendedor = @vendedor if @vendedor
    @entrega.revista = Revista.last
  end

  def create
    if params[:entrega].has_key? :pago
      params[:entrega][:pago] = cadena_a_decimal(params[:entrega][:pago])
    end
    @entrega = Entrega.new(params[:entrega])
    @entrega.vendedor = @vendedor

    if @entrega.save
      if request.env['REQUEST_PATH'] == entregas_path
        flash[:notice] = "La venta se registro exitosamente."
        redirect_to distribucion_path
      else
        redirect_to vendedor_entregas_url(@vendedor)
      end
    else
      if request.env['REQUEST_PATH'] == entregas_path
        flash[:notice] = "No pudo registrarse la venta."
        redirect_to distribucion_path
      else
        render :action => "new"
      end
    end
  end

  def show
    
  end

  private
    def get_vendedor
      begin
        @vendedor = Vendedor.find(params[:vendedor_id])
      rescue
      end
      if not @vendedor and params.has_key?(:entrega) and params[:entrega].has_key?(:vendedor_credencial)
        @vendedor = Vendedor.find_by_credencial(params[:entrega][:vendedor_credencial])
        params[:entrega].delete(:vendedor_credencial)
      end
    end
end