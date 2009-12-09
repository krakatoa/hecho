class CreatePreguntas < ActiveRecord::Migration
  def self.up
    create_table :preguntas do |t|
      t.string  :titulo
      t.text    :respuestas
      t.boolean :con_comentario, :default => false
      t.boolean :multiple, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :preguntas
  end
end
