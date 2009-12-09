class Respuesta < ActiveRecord::Base
  belongs_to :pregunta
  belongs_to :encuesta

  serialize :respuesta

  validates_presence_of :encuesta_id
end
