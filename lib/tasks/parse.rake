require 'rubygems'
require 'fastercsv'
require 'chronic'
require 'roo'

DATA_DIR = File.expand_path(File.join(RAILS_ROOT, "db", "data"))
EDICIONES = [110, 111]

namespace :db do
  desc 'Test'
  task(:parse => :environment) do
    Rake::Task['db:parse:preparar_csv_vendedores'].invoke
    Rake::Task['db:parse:preparar_csv_ediciones'].invoke
    Rake::Task['db:parse:cargar_csv_vendedores'].invoke
    Rake::Task['db:parse:cargar_csv'].invoke
  end

  namespace :parse do
    desc 'Convierte el XLS de Vendedores a CSV'
    task(:preparar_csv_vendedores => :environment) do
      parse_xls_vendedores
    end

    desc 'Convierte los XLS a CSV'
    task(:preparar_csv_ediciones => :environment) do
      EDICIONES.each do |e|
        parse_xls_to_csv(e)
      end
    end

    desc 'Carga la base con la informacion de los CSV'
    task(:cargar_csv_vendedores => :environment) do
      # row[1] # numero credencial

      ind_row = 1
      FasterCSV.foreach(File.expand_path(File.join(DATA_DIR, "vendedores.csv"))) do |row|
        credencial = row[1].to_i if row[1]
        nombre_y_apellido = row[2].strip if row[2]
        # sexo = row[3] # [ M F ]
        fecha_nacimiento = Chronic.parse(row[4]) if row[4] # 13/01/1956
        # localidad = row[6]
        # inscripcion = row[7] # 17/01/2008
        # paradas = row[8]
        # activo = row[9]
        # observaciones = row[10]
        # telefono = row[11]
        Vendedor.create(:credencial => credencial, :nombre => nombre_y_apellido, :fecha_nacimiento => fecha_nacimiento)
        
        ind_row += 1
      end
    end

    desc 'Carga la base con la informacion de los CSV'
    task(:cargar_csv => :environment) do
      vendedores_inexistentes = []

      EDICIONES.each do |edicion|
        # row[0] #Fecha compra
        # row[4].to_f # pago
        # row[9].to_i # promo
        # row[10].to_i # ingreso
        # row[11].to_i # cumpleanos

        begin
          revista = Revista.find_by_numero(edicion)

          ind_row = 1
          FasterCSV.foreach(File.expand_path(File.join(DATA_DIR, "#{edicion}.csv"))) do |row|
            vendedor_credencial = row[2].to_i
            begin
              vendedor = Vendedor.find_by_credencial(vendedor_credencial)
            rescue ActiveRecord::RecordNotFound
              vendedor = nil
            end
            if vendedor
              cantidad_pagas = row[3].to_i
              pago = NumericHandler.str_a_float(row[4])

              entrega = Entrega.new(:vendedor => vendedor,
                              :revista => revista,
                              :cantidad_pagas => cantidad_pagas,
                              :pago => pago)
              if entrega.save
                #puts "Se guardo la fila #{ind_row}."
              else
                puts "No se guardo la fila #{ind_row}."
              end
            else
              vendedores_inexistentes.push vendedor_credencial
            end
            ind_row += 1
          end
        rescue ActiveRecord::RecordNotFound #=> error
          puts "La revista '#{edicion}' no existe"
        end
      end
      if vendedores_inexistentes.size > 0
        vendedores_inexistentes.uniq!
        puts "Los siguientes vendedores no existen:\n#{vendedores_inexistentes.join(", ")}."
      end
    end
  end
end

def parse_xls_to_csv(edicion)
  return false if edicion.blank?
  puts "Cargando #{edicion}.xls."
  excel = Excel.new(File.expand_path(File.join(DATA_DIR, "#{edicion}.xls")))
  
  excel.default_sheet = 1
  excel.to_csv(File.join(DATA_DIR, "#{edicion}.csv"))
end

def parse_xls_vendedores
  puts "Cargando vendedores.xls"
  excel = Excel.new(File.expand_path(File.join(DATA_DIR, "vendedores.xls")))
  
  excel.default_sheet = 1
  excel.to_csv(File.join(DATA_DIR, "vendedores.csv"))
end