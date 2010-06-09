
class Vendedor < ActiveRecord::Base
  has_many :compras, :class_name => "Entrega", :order => "created_at ASC"
  has_many :encuestas, :order => "created_at ASC"
  has_many :uso_servicios
  has_many :puntos_de_venta, :class_name => "PuntoDeVenta"
  belongs_to :pais
  belongs_to :provincia

  validates_presence_of :credencial, :nombre
  #validates_presence_of :apellido, :fecha_nacimiento, :sexo, :pais_id, :personal_inscripcion, :fecha_inscripcion
  validates_presence_of :provincia_id, :if => "pais == Pais.find_by_nombre('Argentina')"
  validates_uniqueness_of :credencial

  before_save :chequear_provincia
  after_destroy :borrar_foto

  named_scope :de_sexo, lambda { |sexo| { :conditions => ["sexo like ?", sexo] } }

  attr_accessor :image

  # TODO validar formato credencial

  @@sexos = %w[ Varon Mujer ]

  def initialize(attributes={})
    super
    self.credencial ||= Vendedor.ultima_credencial + 1
  end

  def edad
    return nil unless self.fecha_nacimiento
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

  def total_vendidas
    self.compras.inject(0) {|ventas, c| ventas = ventas + c.cantidad}
  end

  def nacionalidad
    nacionalidad = ""
    nacionalidad += "#{provincia.nombre}, " if provincia
    nacionalidad += pais.nombre
  end

  def foto_fullpath
    File.join(IMAGES_PATH, self.foto_filename)
  end

  def foto_path
    return nil unless File.exists? foto_fullpath
    return self.foto_filename
  end

  def foto_filename
    "#{self.id}.jpg"
  end

  def foto_public_path
    PUBLIC_IMAGES_URI.merge(foto_filename).to_s
  end

  private
    def self.sexos
      @@sexos
    end

    def self.ultima_credencial
      ultimo_vendedor = Vendedor.last(:order => :credencial)
      ultimo_vendedor.blank? ? 0 : ultimo_vendedor.credencial
    end

    def borrar_foto
      File.delete self.foto_fullpath if File.exists? self.foto_fullpath
    end

    def chequear_provincia
      return if not self.pais
      self.provincia = nil unless self.pais.nombre.eql?("Argentina")
    end
end
