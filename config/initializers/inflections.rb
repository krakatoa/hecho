# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'vendedor', 'vendedores'
  inflect.irregular 'inscripcion', 'inscripciones'
  inflect.irregular 'promocion', 'promociones'
  inflect.irregular 'pais', 'paises'
  inflect.irregular 'control_stock', 'controles_stock'
  inflect.irregular 'punto_de_venta', 'puntos_de_venta'
end