class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|

     t.string :nome
     t.string :sexo
     t.string :rg
     t.string :cpf
     t.string :cep
     t.string :logradouro
     t.string :numero
     t.string :municipio
     t.string :complemento
     t.string :uf
     t.string :telefone_residencial
     t.string :telefone_celular
     t.string :email
     t.string :senha
     t.string :perfil
     

      t.timestamps
    end
  end
end
