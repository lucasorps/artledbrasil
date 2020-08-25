class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|

      t.references :usuario
      t.decimal :preco_total
      t.string :status
      t.datetime :datacompra
      t.datetime :dataentrega
      t.datetime :datapagamento

      t.timestamps
    end
  
   
  
  end


end
