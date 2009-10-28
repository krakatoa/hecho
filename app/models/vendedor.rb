class Vendedor < ActiveRecord::Base
  has_many :compras, :class_name => "Entrega", :order => "created_at ASC"
  belongs_to :pais
  belongs_to :provincia

  validates_presence_of :credencial, :nombre, :apellido, :fecha_nacimiento, :sexo, :pais_id, :personal_inscripcion, :fecha_inscripcion
  validates_presence_of :provincia_id, :if => "pais == Pais.find_by_nombre('Argentina')"
  validates_uniqueness_of :credencial

  named_scope :de_sexo, lambda { |sexo| { :conditions => ["sexo like ?", sexo] } }

  # TODO validar formato credencial

  @@sexos = %w[ Varon Mujer ]

  def edad
    edad = Time.now.year - self.fecha_nacimiento.year
    edad -= 1 if (Time.parse("#{self.fecha_nacimiento.day}-#{self.fecha_nacimiento.month}-#{Time.now.year}") > Time.now)
    return edad
  end

  def saldo
    saldo = 0
    self.compras.each do |compra|
      saldo += compra.saldo_vendedor
    end
    return saldo
  end

  def nacionalidad
    nacionalidad = ""
    nacionalidad += "#{provincia.nombre}, " if provincia
    nacionalidad += pais.nombre
  end

  private
    def self.sexos
      @@sexos
    end
end
