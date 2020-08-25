class Usuario < ActiveRecord::Base

validates :nome, presence:  { message: "Dados obrigatorios nao foram informados" }, length: {maximum: 50, message: 'O campo Nome foi preenchido com a quantidade de caracteres inadequada'} 
validates :senha, presence: { message: "Dados obrigatorios nao foram informados" }, length: {minimum: 8, message: 'O campo Senha foi preenchido com a quantidade de caracteres inadequada'}
validates :cep,  presence: { message: "Dados obrigatorios nao foram informados" }
validates :logradouro,  presence: { message: "Dados obrigatorios nao foram informados" }, length: {maximum: 50, message: 'O campo Logradouro foi preenchido com a quantidade de caracteres inadequada'}
validates :numero, presence: { message: "Dados obrigatorios nao foram informados" }, length: {maximum: 5, message: 'O campo Numero foi preenchido com a quantidade de caracteres inadequada'}
validates :municipio,  presence: { message: "Dados obrigatorios nao foram informados" }, length: {maximum: 30, message: 'O campo Municipio foi preenchido com a quantidade de caracteres inadequada'}
validates :uf,  presence: { message: "Dados obrigatorios nao foram informados" }
validates :complemento,  presence: { message: "Dados obrigatorios nao foram informados" }, length: {maximum: 10, message: 'O campo Complemento foi preenchido com a quantidade de caracteres inadequada'}


VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}

has_many :pedidos

UF = [

["Rio de Janeiro", "RJ"],

["Sao Paulo", "SP"],

["Minas Gerais", "MG"],

["Pernambuco", "PE"],

["Parana", "PR"],

["Alagoas", "AL"]

];


PERFIL = [

["Administrador", "ADM"],

["Funcionario", "FUN"],

["Cliente", "CLI"]

];




end
