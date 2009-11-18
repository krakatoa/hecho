module ServiciosHelper
  def hash_servicios
    "{" + Rubro.all.collect{|rubro| "#{rubro.id}: [#{rubro.servicios.collect {|servicio| "[#{servicio.id}, \"" + servicio.nombre.gsub("\"", "\\\"") + "\"]"}.join(",")}]"}.join(",") + "}"
  end
end
