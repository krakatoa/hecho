class CumpleanosPromocion < Promocion
  def calculo(entrega)
    entrega.vendedor.edad
  end
end