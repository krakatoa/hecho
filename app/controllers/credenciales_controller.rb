class CredencialesController < ApplicationController
  def index
    if request.post?
      @vendedor = Vendedor.find_by_credencial(params["vendedor"]["credencial"])
      redirect_to credencial_vendedor_url(@vendedor)
    end
  end
end
