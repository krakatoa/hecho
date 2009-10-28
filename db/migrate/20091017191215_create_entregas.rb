class CreateEntregas < ActiveRecord::Migration
  def self.up
    create_table :entregas do |t|
      t.integer :vendedor_id, :null => false, :default => nil
      t.integer :revista_id, :null => false, :default => nil
      t.integer :cantidad_pagas, :default => 0
      t.integer :cantidad_gratis, :default => 0
      t.float :costo, :null => false, :default => nil
      t.float :pago, :default => 0
      #t.integer :promocion_id, :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :entregas
  end
end
