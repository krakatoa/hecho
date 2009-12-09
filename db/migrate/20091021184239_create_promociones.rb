class CreatePromociones < ActiveRecord::Migration
  def self.up
    create_table :promociones do |t|
      t.string :promocion_tipo, :null => false, :default => nil
      t.boolean :activa, :default => false
      t.integer :cantidad, :default => 0
      t.string :nombre, :null => false, :default => nil
      t.boolean :desactivable, :default => false
      t.boolean :cantidad_variable, :default => false
    end
  end

  def self.down
    drop_table :promociones
  end
end
