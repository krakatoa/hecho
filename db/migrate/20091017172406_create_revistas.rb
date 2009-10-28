class CreateRevistas < ActiveRecord::Migration
  def self.up
    create_table :revistas do |t|
      t.integer :numero, :null => false, :default => nil
      t.integer :mes, :null => false, :default => nil
      t.integer :ano, :null => false, :default => nil
      t.integer :stock, :default => 0
      t.float   :valor, :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :revistas
  end
end
