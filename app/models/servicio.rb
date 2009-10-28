class Servicio < ActiveRecord::Base
  belongs_to :rubro

  validates_presence_of :nombre, :rubro_id
end
