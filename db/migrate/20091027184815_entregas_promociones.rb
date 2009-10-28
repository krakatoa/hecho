class EntregasPromociones < ActiveRecord::Migration
  def self.up
    create_table :entregas_promociones, :id => false do |t|
      t.integer :entrega_id
      t.integer :promocion_id
    end
  end

  def self.down
    drop_table :entregas_promociones
  end
end