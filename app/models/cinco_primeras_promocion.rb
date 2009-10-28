class CincoPrimerasPromocion < Promocion
  #def after_initialize
  #  if self.cantidad == 0
  #    self.activa = false
  #    self.save
  #  end
  #end

  def activar
    if self.activa == false
      self.activa = true
      self.cantidad = 5
      return self.save
    else
      return false
    end
  end

  def restar_una
    if self.cantidad > 0
      self.cantidad -= 1
      self.activa = !(self.cantidad == 0)
      self.save!
      return self.cantidad
    else
      return false
    end
  end

  def calculo(entrega)
    5
  end
end