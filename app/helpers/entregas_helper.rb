module EntregasHelper
  def mostrar_promociones(entrega)
   entrega.promociones.collect(&:nombre).join(" + ")
  end
end
