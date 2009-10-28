class Rubro < ActiveRecord::Base
  has_many :servicios

  validates_presence_of :nombre
end
