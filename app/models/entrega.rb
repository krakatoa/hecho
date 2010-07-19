class Entrega < ActiveRecord::Base
  belongs_to :revista
  belongs_to :vendedor
  has_and_belongs_to_many :promociones, :uniq => true

  validates_presence_of :vendedor_id, :cantidad
  validate :validar_cantidad, :validar_stock

  def initialize(attributes = {})
    super
    self.cantidad_pagas ||= 0
    self.pago ||= 0
  end

  def after_initialize
    if self.new_record?
      if CincuentaPorCientoPromocion.first.activa?
        self.promociones << CincuentaPorCientoPromocion.first
      elsif CincoPrimerasPromocion.first.activa?
        self.promociones << CincoPrimerasPromocion.first
      elsif DosPorUnaPromocion.first.activa?
        self.promociones << DosPorUnaPromocion.first
      end
    end
  end

  def after_create
    if self.promociones.include? CincoPrimerasPromocion.first
      CincoPrimerasPromocion.first.restar_una
    end
  end

  def cantidad
    self.cantidad_pagas + self.cantidad_gratis
  end

  def calculo_promocion
    total_promocion = 0
    if self.promociones.size > 0
      self.promociones.each do |p|
        total_promocion += p.calculo(self)
      end
    end
    return total_promocion
  end

  def calculo_promocion!
    self.cantidad_gratis = self.calculo_promocion
  end

  def before_save
    self.costo = self.revista.valor * self.cantidad_pagas if self.revista
    self.costo ||= 0
    self.calculo_promocion!
  end

  def saldo_vendedor
    self.pago - self.costo
  end

  def vendedor=(vendedor)
    return if not vendedor
    write_attribute("vendedor_id", vendedor.id)
    if self.vendedor and self.vendedor.fecha_nacimiento and (self.vendedor.fecha_nacimiento.day == Time.now.day) and (self.vendedor.fecha_nacimiento.month == Time.now.month)
      self.promociones << CumpleanosPromocion.first
    end
    if self.vendedor and (self.vendedor.compras.size == 0)
      self.promociones << InicialesPromocion.first
    end
    self.calculo_promocion!
  end

  #def cantidad_pagas=(cantidad)
  #  cantidad = self.revista.stock if cantidad > self.revista.stock
  #  write_attribute("cantidad_pagas", cantidad)
  #end

  #def cantidad_gratis=(cantidad)
  #  cantidad = self.revista.stock if cantidad > self.revista.stock
  #  write_attribute("cantidad_gratis", cantidad)
  #end

  private
  def validar_stock
    if (self.revista && self.revista.stock < self.cantidad)
      self.errors.add(:stock, "insuficiente")
    end
  end

  def validar_cantidad
    unless (self.cantidad > 0)
      self.errors.add(:cantidad, "insuficiente")
    end
  end
end
