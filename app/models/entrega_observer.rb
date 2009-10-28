class EntregaObserver < ActiveRecord::Observer
  def after_save(model)
    model.revista.restar_stock(model.cantidad)
  end
end