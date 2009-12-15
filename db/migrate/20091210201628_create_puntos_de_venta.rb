class CreatePuntosDeVenta < ActiveRecord::Migration
  def self.up
    create_table :puntos_de_venta do |t|
      t.integer :vendedor_id, :null => false
      t.string :lugar, :null => false
      t.date :inicio, :default => nil
      t.date :fin, :default => nil
    end
  end

  def self.down
    drop_table :puntos_de_venta
  end
end
