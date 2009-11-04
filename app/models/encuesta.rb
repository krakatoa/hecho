class Encuesta < ActiveRecord::Base
  belongs_to :vendedor
  has_many :items, :class_name => "Respuesta", :order => "created_at ASC"

  def initialize(attributes = {})
    super
    #setear_hash_respuestas
  end

  #private
  #  def setear_hash_respuestas
  #    preguntas = Pregunta.all
  #    preguntas.each do |pregunta|
  #      self.items << Respuesta.new(:pregunta => pregunta)
  #    end
  #  end
end
