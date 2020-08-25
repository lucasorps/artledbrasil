class Pagamento < ActiveRecord::Base

belongs_to :pedido

validates :agencia, presence:  { message: "Dados obrigatorios nao foram informados", if: :forma_pagamento == 'C' }, length: {maximum: 5, message: 'O campo {%attr} foi preenchido com a quantidade de caracteres inadequada'} 
validates :conta, presence:  { message: "Dados obrigatorios nao foram informados", if: :forma_pagamento == 'C' }, length: {maximum: 10, message: 'O campo {%attr} foi preenchido com a quantidade de caracteres inadequada'} 
validates :bandeira, presence:  { message: "Dados obrigatorios nao foram informados", if: :forma_pagamento == 'C' }, length: {maximum: 10, message: 'O campo {%attr} foi preenchido com a quantidade de caracteres inadequada'} 


FORMAPAGAMENTO = [

["Credito", "C"],

["Boleto Bancario", "B"]

];


BANDEIRACARTAO = [

["Visa", "VS"],

["Master Card", "MC"]

];


end
