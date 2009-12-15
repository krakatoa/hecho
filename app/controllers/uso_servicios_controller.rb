class UsoServiciosController < ApplicationController
  before_filter :get_vendedor

  def index
    if request.post?
      @vendedor = Vendedor.find_by_credencial(params["vendedor"]["credencial"])
      if @vendedor
        redirect_to new_vendedor_uso_servicio_url(@vendedor)
      else
        render :template => "uso_servicios/servicios_sociales"
      end
    else
      if @vendedor
        @usos_servicios = @vendedor.uso_servicios
      else
        render :template => "uso_servicios/servicios_sociales"
      end
    end
    
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
      begin
        @vendedor = Vendedor.find(params[:vendedor_id])
      rescue
      end
    end
end
