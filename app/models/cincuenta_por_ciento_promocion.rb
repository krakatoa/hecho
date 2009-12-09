class CincuentaPorCientoPromocion < Promocion
  def activar
    if self.activa == false
      self.activa = true
      return self.save
    else
      return false
    end
  end

  def desactivar
    if self.activa == true
      self.activa = false
      return self.save
    else
      return false
    end
  end

  def calculo(entrega)
    entrega.cantidad_pagas / 2
  end
end