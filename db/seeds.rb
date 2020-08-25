# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Usuario.create(nome: 'Administrador', uf: 'SP',  municipio: 'Sao Paulo', numero: '11', logradouro: 'Rua 1' , cep: '111', email: 'adm@artled.com.br',senha: 'lucasleandro', perfil: 'ADM')
Usuario.create(nome: 'Funcionario 1', uf: 'SP',  municipio: 'Sao Paulo', numero: '11', logradouro: 'Rua 1' , cep: '111', email: 'funcionario1@artled.com.br',senha: 'funcionario1', perfil: 'FUN')
Usuario.create(nome: 'Cliente 1', uf: 'SP',  municipio: 'Sao Paulo', numero: '11', logradouro: 'Rua 1' , cep: '111', email: 'cliente@gmail.com.br', senha: 'cliente1', perfil: 'CLI')
