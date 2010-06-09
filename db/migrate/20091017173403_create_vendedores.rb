class CreateVendedores < ActiveRecord::Migration
  def self.up
    create_table :vendedores do |t|
      t.integer :credencial, :null => false, :default => nil
      t.string  :nombre, :null => false
      t.string  :apellido, :default => nil#, :null => false
      t.date    :fecha_nacimiento, :default => nil#, :null => false
      t.string  :sexo, :default => nil#, :null => false
      t.integer :pais_id, :default => nil#, :null => false
      t.integer :provincia_id, :default => nil
      t.string :telefono, :default => nil
      t.string :direccion, :default => nil
      t.string :personal_inscripcion, :default => nil#, :null => false
      t.date :fecha_inscripcion, :default => nil#, :null => false

      # encuesta

      # 1. Como te enteraste de la existencia de HBA? (items / otro comentario)
      # Otro vendedor/en la calle/alguien te conto;
      # Por una organización para sin techo;
      # Por diario/TV/radio
      # En algun comedor comunitario
      # Otro
      # 6. Estas en la calle?
      # Si/No
      # 7. Hace cuanto tiempo que estas en la calle?
      # (Semanas/Meses/Anos)
      # 8. Donde estas viviendo ahora?
      # (En la calle/Pension-Hotel/Casa de amigos/Hogar/Casa ocupada/Otra)
      # 9. Tenes alguna necesidad urgente?
      # (Problemas legales, problemas de salud, Necesidad de Apoyo Terapeutico, Problemas de Documentacion)
      # 10. Telefono
      # 11. Direccion
      # 14. Taller que realizo/realiza/realizaria si estuviera...

      t.timestamps
    end

    # TODO indices
  end

  def self.down
    drop_table :vendedores
  end
end
