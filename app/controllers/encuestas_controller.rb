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
      pregunta = Pregunta.find(key.to_i)
      if pregunta.multiple?
        respuesta_params = {:respuesta => respuesta_params}
        #puts respuesta_params.inspect
        #new_hash = {}
      end
      respuesta = Respuesta.new(respuesta_params)
      respuesta.encuesta_id = @encuesta.id
      respuesta.pregunta = pregunta

      @encuesta.items << respuesta
    }

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
