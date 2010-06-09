module VendedoresHelper
  def mostrar_provincia_pais(vendedor)
    return "" unless vendedor.pais
    mostrar = ""
    if vendedor.pais == Pais.find_by_nombre("Argentina")
      mostrar = vendedor.provincia.nombre + ", "
    end
    mostrar << vendedor.pais.nombre
  end
end
