class UsoServicio < ActiveRecord::Base
  belongs_to :rubro
  belongs_to :servicio
  belongs_to :vendedor

  validates_presence_of :rubro_id, :vendedor_id, :fecha

  def servicio=(servicio)
    servicio = Servicio.find(servicio) if servicio.is_a? String
    self.write_attribute(:servicio_id, servicio.id)
    self.rubro = servicio.rubro
  end
end