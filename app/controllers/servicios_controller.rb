class ServiciosController < ApplicationController
  def index
    @rubros = Rubro.all
  end
end
