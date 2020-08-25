# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150812200602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carrinhos", force: true do |t|
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.integer  "quantidade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carrinhos", ["pedido_id"], name: "index_carrinhos_on_pedido_id", using: :btree
  add_index "carrinhos", ["produto_id"], name: "index_carrinhos_on_produto_id", using: :btree

  create_table "pagamentos", force: true do |t|
    t.string   "forma_pagamento"
    t.datetime "data_pagamento"
    t.datetime "data_vencimento"
    t.string   "agencia"
    t.string   "conta"
    t.string   "bandeira"
    t.string   "instituicao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", force: true do |t|
    t.integer  "usuario_id"
    t.decimal  "preco_total"
    t.string   "status"
    t.datetime "datacompra"
    t.datetime "dataentrega"
    t.datetime "datapagamento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", force: true do |t|
    t.string   "nome"
    t.string   "codigo"
    t.string   "categoria"
    t.integer  "base"
    t.integer  "referencia"
    t.integer  "tensao"
    t.string   "garantia"
    t.integer  "potencia"
    t.integer  "temperatura_cor"
    t.string   "dimensoes"
    t.string   "durabilidade"
    t.integer  "fluxo_luminoso"
    t.text     "descricao"
    t.decimal  "preco_unitario",      precision: 9, scale: 2
    t.boolean  "visivel"
    t.boolean  "destaque"
    t.integer  "quantidade"
    t.string   "facho"
    t.string   "lente"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "usuarios", force: true do |t|
    t.string   "nome"
    t.string   "sexo"
    t.string   "rg"
    t.string   "cpf"
    t.string   "cep"
    t.string   "logradouro"
    t.string   "numero"
    t.string   "municipio"
    t.string   "complemento"
    t.string   "uf"
    t.string   "telefone_residencial"
    t.string   "telefone_celular"
    t.string   "email"
    t.string   "senha"
    t.string   "perfil"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
