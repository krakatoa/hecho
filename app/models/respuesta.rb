class Respuesta < ActiveRecord::Base
  belongs_to :pregunta
  belongs_to :encuesta

  validates_presence_of :encuesta_id
end
