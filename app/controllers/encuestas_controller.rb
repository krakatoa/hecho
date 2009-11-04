class EncuestasController < ApplicationController
  before_filter :get_vendedor

  def index
  end

  def new
    @encuesta = Encuesta.new(:vendedor => @vendedor)
  end

  def create
    @encuesta = Encuesta.create!(:vendedor => @vendedor)
    params[:encuesta][:items].each_pair { |key, respuesta_params|
      respuesta = Respuesta.new(respuesta_params)
      respuesta.encuesta_id = @encuesta.id
      respuesta.pregunta_id = key.to_i
      @encuesta.items << respuesta
    }
    @encuesta.save!

    if @encuesta.save
      redirect_to vendedor_url(@vendedor)
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
