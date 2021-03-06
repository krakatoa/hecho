# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def coleccion_paises
    Pais.all(:order => :nombre).collect { |pais| [pais.nombre, pais.id] } << (["Otro", 0])
  end

  def coleccion_provincias
    Provincia.all.collect { |provincia| [provincia.nombre, provincia.id] }
  end

  def coleccion_rubros
    Rubro.all.collect { |rubro| [rubro.nombre, rubro.id] }
  end

  def coleccion_revistas
    Revista.all(:order => "numero DESC").collect { |revista| [revista.numero, revista.id] }
  end

  def formato_fecha(fecha)
    # 5/30/09 1:30pm
    #fecha.strftime("%d/%m/%y %I:%M%p").downcase unless fecha.blank?
    fecha.strftime("%d/%m/%y").downcase unless fecha.blank?
  end
end
