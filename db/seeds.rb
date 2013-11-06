# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PlayType.destroy_all
PlayType.create(description: "Gol! De {0}!", scorable: true)
PlayType.create(description: "{0} marcou um GOLAÇO de falta!", scorable: true)
PlayType.create(description: "Falta marcada! Pênalti! {0} cobrou e... É GOL!", scorable: true)
PlayType.create(description: "Falta marcada! Pênalti! {0} cobrou e... PRA FORA!", scorable: false)
PlayType.create(description: "Falta marcada! Pênalti! {0} cobrou e... {1} FAZ UMA LINDA DEFESA!", scorable: false)
PlayType.create(description: "Gol OLÍMPICO de {0}! Sensacional!", scorable: true)
PlayType.create(description: "Falta de {0} em cima de {1}!", scorable: false)
PlayType.create(description: "Falta grave de {0} em cima de {1}! Cartão amarelo!", scorable: false)
PlayType.create(description: "Falta CRIMINOSA de {0} em cima de {1}! Cartão vermelho! Foi expulso!", scorable: false)