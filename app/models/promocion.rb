class Promocion < ActiveRecord::Base
  self.inheritance_column = "promocion_tipo"

  has_and_belongs_to_many :entregas

  validates_presence_of :promocion_tipo, :nombre

  def activar
    return false
  end

  def desactivar
    return false
  end

  def sumar_cantidad(cantidad)
    self.cantidad += cantidad
    self.save
  end
end
