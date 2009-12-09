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
end
