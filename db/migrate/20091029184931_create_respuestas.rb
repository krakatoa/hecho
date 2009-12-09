class CreateRespuestas < ActiveRecord::Migration
  def self.up
    create_table :respuestas do |t|
      t.integer :encuesta_id, :null => false, :default => nil
      t.integer :pregunta_id, :null => false, :default => nil
      t.text :respuesta, :default => nil
      t.string  :comentario, :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :respuestas
  end
end
