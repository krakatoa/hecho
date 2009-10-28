class RevistasController < ApplicationController
  def index
    @revistas = Revista.all
  end

  def new
    @revista = Revista.new
  end

  def create
    @revista = Revista.new(params[:revista])

    if @revista.save!
      redirect_to revistas_path
    else
      render :action => "new"
    end
  end

  def show
    @revista = Revista.find(params[:id])
  end

  def edit
    @revista = Revista.find(params[:id])
  end

  def update
    @revista = Revista.find(params[:id])

    if @revista.update_attributes(params[:revista])
      redirect_to revistas_path
    else
      render :action => "edit"
    end
  end
end
