# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091027184815) do

  create_table "entregas", :force => true do |t|
    t.integer  "vendedor_id",                      :null => false
    t.integer  "revista_id",                       :null => false
    t.integer  "cantidad_pagas",  :default => 0
    t.integer  "cantidad_gratis", :default => 0
    t.float    "costo",                            :null => false
    t.float    "pago",            :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entregas_promociones", :id => false, :force => true do |t|
    t.integer "entrega_id"
    t.integer "promocion_id"
  end

  create_table "inscripciones", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paises", :force => true do |t|
    t.string "nombre", :null => false
  end

  create_table "promociones", :force => true do |t|
    t.string  "promocion_tipo",                    :null => false
    t.boolean "activa",         :default => false
    t.integer "cantidad",       :default => 0
    t.string  "nombre",                            :null => false
  end

  create_table "provincias", :force => true do |t|
    t.string "nombre"
  end

  create_table "revistas", :force => true do |t|
    t.integer  "numero",                    :null => false
    t.integer  "mes",                       :null => false
    t.integer  "ano",                       :null => false
    t.integer  "stock",      :default => 0
    t.float    "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubros", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servicios", :force => true do |t|
    t.string   "nombre"
    t.integer  "rubro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uso_servicios", :force => true do |t|
    t.integer  "rubro_id",    :null => false
    t.integer  "servicio_id"
    t.integer  "vendedor_id", :null => false
    t.date     "fecha",       :null => false
    t.text     "comentarios"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendedores", :force => true do |t|
    t.integer  "credencial",           :null => false
    t.string   "nombre",               :null => false
    t.string   "apellido",             :null => false
    t.date     "fecha_nacimiento",     :null => false
    t.string   "sexo",                 :null => false
    t.integer  "pais_id",              :null => false
    t.integer  "provincia_id"
    t.string   "personal_inscripcion", :null => false
    t.date     "fecha_inscripcion",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
