class CreateInscripciones < ActiveRecord::Migration
  def self.up
    create_table :inscripciones do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :inscripciones
  end
end
