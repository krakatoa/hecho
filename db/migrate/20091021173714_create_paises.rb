class CreatePaises < ActiveRecord::Migration
  def self.up
    create_table :paises do |t|
      t.string :nombre, :null => false
    end
  end

  def self.down
    drop_table :paises
  end
end
