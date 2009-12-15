class PuntoDeVenta < ActiveRecord::Base
  belongs_to :vendedor

  validates_presence_of :vendedor_id, :lugar

  def activo?
    # no parece que haga falta un campo mas en la tabla, desprendiendose de los campos de fechas (inicio, fin)
    not inicio.blank? and not fin
  end
end
