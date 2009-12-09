class ControlesStockController < ApplicationController
  def index
    @controles_stock = ControlStock.all(:order => "created_at DESC")
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
