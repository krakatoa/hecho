class ControlesStockController < ApplicationController
  def index
    if not params[:revista_id].blank?
      @revista = Revista.find(params[:revista_id])
      @controles_stock = @revista.controles_stock
    else
      @controles_stock = ControlStock.all(:order => "created_at DESC")
    end
  end

  def new
    @control_stock = ControlStock.new
  end

  def create
    @control_stock = ControlStock.new(params[:control_stock])

    if @control_stock.save
      redirect_to controles_stock_path
    else
      render :action => "new"
    end
  end
end
