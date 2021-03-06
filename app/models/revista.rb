class Revista < ActiveRecord::Base
  # TODO validar rango de mes entre 1 y 12
  # TODO generar el proximo numero

  has_many :controles_stock, :class_name => "ControlStock", :order => "created_at ASC"

  validates_presence_of :numero, :mes, :ano

  def initialize(attributes={})
    super
    ultimo_ejemplar = Revista.ultimo_ejemplar
    if ultimo_ejemplar
      self.numero ||= ultimo_ejemplar.numero + 1
      self.valor ||= ultimo_ejemplar.valor
      if not self.mes and not self.ano
        self.mes ||= ultimo_ejemplar.mes + 1
        self.ano ||= ultimo_ejemplar.ano
        if self.mes > 12
          self.ano += 1
          self.mes = 1
        end
      end
    else
      self.numero ||= 1
      self.valor ||= 0
    end
  end

  def control_stock(variacion)
    ControlStock.create(:revista => self, :variacion => variacion)
  end

  def sumar_stock(cantidad)
    self.stock += cantidad
    self.save
  end

  def restar_stock(cantidad)
    self.stock -= cantidad
    self.save
  end

  private
    def self.sumar_stock(numero, cantidad)
      begin
        r = Revista.find_by_numero!(numero)
        r.sumar_stock(cantidad)
      rescue ActiveRecord::RecordNotFound
        return false
      end
    end

    def self.restar_stock(numero, cantidad)
      begin
        r = Revista.find_by_numero!(numero)
        r.restar_stock(cantidad)
      rescue ActiveRecord::RecordNotFound
        return false
      end
    end

    def self.ultimo_ejemplar
      Revista.first(:order => "ano DESC, mes DESC")
    end

    def self.ultimo_valor
      ultimo_ejemplar = Revista.ultimo_ejemplar
      return 0 if not ultimo_ejemplar
      return ultimo_ejemplar.valor
    end
end