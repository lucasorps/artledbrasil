class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
     
     t.string :nome
     t.string :codigo
     t.string :categoria
     t.integer :base
     t.integer :referencia
     t.integer :tensao
     t.string :garantia
     t.integer :potencia
     t.integer :temperatura_cor
     t.string :dimensoes
     t.string :durabilidade
     t.integer :fluxo_luminoso
     t.text :descricao, :size => 100
     t.decimal :preco_unitario, :precision => 9, :scale => 2 
     t.boolean :visivel
     t.boolean :destaque
     t.integer :quantidade
     t.string :facho
     t.string :lente
   
      t.timestamps
    end
 
  end
end
