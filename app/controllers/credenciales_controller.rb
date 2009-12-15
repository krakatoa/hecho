class CredencialesController < ApplicationController
  def index
    if request.post?
      @vendedor = Vendedor.find_by_credencial(params["vendedor"]["credencial"])
      if @vendedor
        redirect_to credencial_vendedor_url(@vendedor)
      else
        render
      end
    end
  end
end
