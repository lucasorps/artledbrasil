class Produto < ActiveRecord::Base

#validações

validates :nome, :categoria, :tensao,  :potencia,  :fluxo_luminoso, :lente, :dimensoes,  :temperatura_cor,  :garantia, :descricao, 
:preco_unitario, :quantidade, :base, :durabilidade,  presence: { message: "Dados obrigatorios nao foram informados" }


validates :nome,  length: {maximum: 50, message: 'O campo Nome foi preenchido com a quantidade de caracteres inadequada'}
validates :tensao, length: {maximum: 6, message: 'O campo Tensao foi preenchido com a quantidade de caracteres inadequada'}
validates :lente, length: {maximum: 10, message: 'O campo Lente foram preenchido com o com a quantidade de caracteres inadequada'}
validates :dimensoes, length: {maximum: 10,  message: 'O campo Dimensoes foi preenchido com a quantidade de caracteres inadequada'}
validates :garantia, length: {maximum: 10, message: 'O campo Garantia foi preenchido com a quantidade de caracteres inadequada'}
validates :descricao, length: {maximum: 300, message: 'O campo Descricao foi preenchido com a quantidade de caracteres inadequada'}
validates :base,  length: {maximum: 20, message: 'O campo Base foi preenchido com a quantidade de caracteres inadequada'}
validates :durabilidade,  length: {maximum: 10, message: 'O campo Durabilidade foi preenchido com a quantidade de caracteres inadequada'}


validates :preco_unitario, numericality: {message: 'O campo Preco Unitario esta com caracteres invalidos'}
validates :quantidade, numericality: {message: 'O campo Quantidade esta com caracteres invalidos'}



before_save { self.nome = nome.upcase }

#relacionamentos
has_many :carrinhos
has_many :pedidos,
    :through => :carrinhos







has_attached_file :imagem
#validates_attachment_content_type :imagem, :content_type => /\Aimage/

# Validate filename
#validates_attachment_file_name :imagem, :matches => [/png\Z/, /jpe?g\Z/]

# Explicitly do not validate
#do_not_validate_attachment_file_type :imagem

def self.gerarcodigoproduto(id)

r =  p SecureRandom.base64(3).to_s 
r += p SecureRandom.random_number(9).to_s
r += p SecureRandom.random_number(9).to_s
r += p SecureRandom.random_number(9).to_s
r += id.to_s


return r

end
  


CATEGORIAS = [

["Lampada", "LA"],

["Fita", "FT"],

["Mangueira", "MA"],

["Luminaria", "LU"],

["Reflector", "RE"],

["Painel", "PP"]

]

end
