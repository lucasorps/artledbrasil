class AddImagemToProduto < ActiveRecord::Migration
 
  def self.up
    add_attachment :produtos, :imagem
  end

  def self.down
    remove_attachment :produtos, :imagem
  end

end
