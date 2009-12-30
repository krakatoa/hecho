Revista.create!(:mes => 9, :ano => 2009, :numero => 110, :valor => 0.9, :stock => 500)
Revista.create!(:mes => 10, :ano => 2009, :numero => 111, :stock => 1000)

rubros = []
rubros << Rubro.create!(:nombre => "Participacion en talleres propios")
rubros << Rubro.create!(:nombre => "Participacion en talleres formativos en otras organizaciones")
rubros << Rubro.create!(:nombre => "Problemas legales / Consultorio Juridico")
rubros << Rubro.create!(:nombre => "Derivaciones por tramites")
rubros << Rubro.create!(:nombre => "Derivaciones al sistema de salud")
rubros << Rubro.create!(:nombre => "Formacion")
rubros << Rubro.create!(:nombre => "Servicios generales")

Servicio.create!(:nombre => "Talleres formativos", :rubro => rubros[0])
Servicio.create!(:nombre => "Ciudadania, DDHH, derechos laborales, etc.", :rubro => rubros[0])
Servicio.create!(:nombre => "Prevencion, primeros auxilios", :rubro => rubros[0])
Servicio.create!(:nombre => "Otros", :rubro => rubros[0])
Servicio.create!(:nombre => "DNI", :rubro => rubros[3])
Servicio.create!(:nombre => "Partidas de nacimiento", :rubro => rubros[3])
Servicio.create!(:nombre => "Pasaporte", :rubro => rubros[3])
Servicio.create!(:nombre => "Pensiones y subsidios oficiales", :rubro => rubros[3])
Servicio.create!(:nombre => "Cursos de formacion profesional", :rubro => rubros[5])
Servicio.create!(:nombre => "Becas de estudio", :rubro => rubros[5])
Servicio.create!(:nombre => "Ducha", :rubro => rubros[6])
Servicio.create!(:nombre => "Ropero", :rubro => rubros[6])
Servicio.create!(:nombre => "Bibloteca", :rubro => rubros[6])
Servicio.create!(:nombre => "Otros", :rubro => rubros[6])

Pais.create!(:nombre => "Argentina")
Pais.create!(:nombre => "Bolivia")
Pais.create!(:nombre => "Chile")
Pais.create!(:nombre => "Paraguay")
Pais.create!(:nombre => "Uruguay")

Provincia.create!(:nombre => "Misiones")
Provincia.create!(:nombre => "Corrientes")
Provincia.create!(:nombre => "Entre Rios")
Provincia.create!(:nombre => "Chaco")
Provincia.create!(:nombre => "Santa Fe")
Provincia.create!(:nombre => "Formosa")
Provincia.create!(:nombre => "Rio Negro")
Provincia.create!(:nombre => "Chubut")
Provincia.create!(:nombre => "Capital Federal")
Provincia.create!(:nombre => "Mendoza")
Provincia.create!(:nombre => "San Luis")
Provincia.create!(:nombre => "San Juan")
Provincia.create!(:nombre => "Catamarca")
Provincia.create!(:nombre => "Salta")
Provincia.create!(:nombre => "Jujuy")
Provincia.create!(:nombre => "Tucuman")
Provincia.create!(:nombre => "Santiago del Estero")
Provincia.create!(:nombre => "Cordoba")
Provincia.create!(:nombre => "Buenos Aires")
Provincia.create!(:nombre => "La Pampa")
Provincia.create!(:nombre => "Neuquen")
Provincia.create!(:nombre => "La Rioja")
Provincia.create!(:nombre => "Santa Cruz")
Provincia.create!(:nombre => "Tierra del Fuego")

=begin
Vendedor.create!( :credencial => 521,
                  :nombre => "Oscar",
                  :apellido => "Galvez",
                  :sexo => "Varon",
                  :fecha_nacimiento => Time.parse("01-05-1987"),
                  :pais => Pais.find_by_nombre("Argentina"),
                  :provincia => Provincia.find_by_nombre("Ciudad Autonoma de Buenos Aires"),
                  :personal_inscripcion => "Pepe Pompin",
                  :fecha_inscripcion => Time.now)

Vendedor.create!( :credencial => 522,
                  :nombre => "Dino",
                  :apellido => "Perez",
                  :sexo => "Varon",
                  :fecha_nacimiento => Time.parse("27-10-1980"),
                  :pais => Pais.find_by_nombre("Bolivia"),
                  :personal_inscripcion => "Pepe Pompin",
                  :fecha_inscripcion => Time.now)
=end

CincuentaPorCientoPromocion.create!(:nombre => "50%", :desactivable => true)
CincoPrimerasPromocion.create!(:nombre => "5 primeras", :desactivable => true, :cantidad_variable => true)
DosPorUnaPromocion.create!(:nombre => "2x1", :desactivable => true)
#PackPromocion.create!(:nombre => "Pack")
CumpleanosPromocion.create!(:nombre => "Cumpleanos", :activa => true)
InicialesPromocion.create!(:nombre => "10 iniciales", :activa => true)

#Entrega.create!(:vendedor => Vendedor.first,
#                :revista => Revista.ultimo_ejemplar,
#                :cantidad_pagas => 12,
#                :pago => 5)
#Entrega.create!(:vendedor => Vendedor.first,
#                :revista => Revista.ultimo_ejemplar,
#                :cantidad_pagas => 1,
#                :pago => 1)
#Entrega.create!(:vendedor => Vendedor.last,
#                :revista => Revista.ultimo_ejemplar,
#                :cantidad_pagas => 5,
#                :pago => 1)

Pregunta.create!( :titulo => "Como te enteraste de la existencia de HBA?",
                  :respuestas => { 0 => "Otro vendedor/en la calle/alguien te conto",
                                  1 => "Por una Organizacion para sin techo",
                                  2 => "Por diario/TV/radio",
                                  3 => "En algun comedor comunitario",
                                  4 => "Otro" },
                  :con_comentario => true )
Pregunta.create!( :titulo => "Estas en la calle?",
                  :respuestas => { 0 => "Si",
                                  1 => "No" } )
Pregunta.create!( :titulo => "Hace cuanto tiempo que estas en la calle?",
                  :respuestas => {  0 => "Semanas",
                                    1 => "Meses",
                                    2 => "Anos" },
                  :multiple => true )
Pregunta.create!( :titulo => "Donde estas viviendo ahora?",
                  :respuestas => {  0 => "En la calle",
                                    1 => "Pension/Hotel",
                                    2 => "Casa de amigos",
                                    3 => "Hogar",
                                    4 => "Casa ocupada",
                                    5 => "Otra" },
                  :con_comentario => true )
Pregunta.create!( :titulo => "Tenes alguna necesidad urgente?",
                  :respuestas => {  0 => "Problemas legales",
                                    1 => "Problemas de salud",
                                    2 => "Necesidad de apoyo terapeutico",
                                    3 => "Problemas de documentacion",
                                    4 => "Otra"},
                  :con_comentario => true )
Pregunta.create!( :titulo => "Taller que realizo/realiza/realizaria si estuviera?",
                  :con_comentario => true )
