# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def coleccion_paises
    Pais.all.collect { |pais| [pais.nombre, pais.id] }
  end

  def coleccion_provincias
    Provincia.all.collect { |provincia| [provincia.nombre, provincia.id] }
  end

  def coleccion_rubros
    Rubro.all.collect { |rubro| [rubro.nombre, rubro.id] }
  end
end
