class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
    
    t.string :forma_pagamento
    t.datetime :data_pagamento
    t.datetime :data_vencimento
     t.string :forma_pagamento
      t.string :agencia
       t.string :conta
        t.string :bandeira
         t.string :instituicao
      t.timestamps
    end
  end
end
