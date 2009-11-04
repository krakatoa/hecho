class CreateEncuestas < ActiveRecord::Migration
  def self.up
    create_table :encuestas do |t|
      t.integer :vendedor_id, :null => false, :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :encuestas
  end
end
