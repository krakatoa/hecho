class UsoServiciosController < ApplicationController
  before_filter :get_vendedor

  def index
    @usos_servicios = @vendedor.uso_servicios
  end

  def new
    @uso_servicio = UsoServicio.new(:vendedor => @vendedor)
  end

  def create
    @uso_servicio = UsoServicio.new(params[:uso_servicio])
    @uso_servicio.vendedor = @vendedor

    if @uso_servicio.save!
      redirect_to vendedor_uso_servicios_url(@vendedor)
    else
      render :action => "new"
    end
  end

  def show
    
  end

  def update
    
  end

  private
    def get_vendedor
      @vendedor = Vendedor.find(params[:vendedor_id])
    end
end
