class ControlStockObserver < ActiveRecord::Observer
  def after_save(model)
    unless model.aplicado?
      begin
        model.revista.sumar_stock(model.variacion)
        model.aplicado = true
        model.save
      rescue
      end
    end
  end
end