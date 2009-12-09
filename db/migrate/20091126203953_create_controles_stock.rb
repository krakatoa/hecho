class CreateControlesStock < ActiveRecord::Migration
  def self.up
    create_table :controles_stock do |t|
      t.integer :revista_id, :default => nil, :null => false
      t.integer :variacion, :default => nil, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :controles_stock
  end
end
