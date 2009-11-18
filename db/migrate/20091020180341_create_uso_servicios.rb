class CreateUsoServicios < ActiveRecord::Migration
  def self.up
    create_table :uso_servicios do |t|
      t.integer :rubro_id, :null => false
      t.integer :servicio_id, :default => nil
      t.integer :vendedor_id, :null => false
      t.date :fecha, :null => false
      t.text :comentario

      t.timestamps
    end
  end

  def self.down
    drop_table :uso_servicios
  end
end
