module VendedoresHelper
  def mostrar_provincia_pais(vendedor)
    mostrar = ""
    if vendedor.pais == Pais.find_by_nombre("Argentina")
      mostrar = vendedor.provincia.nombre + ", "
    end
    mostrar << vendedor.pais.nombre
  end
end
