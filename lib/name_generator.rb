module NameGenerator
  COMMON_NAMES = [
    'Alan',
		'Bruno',
		'Carlos',
		'Diego',
		'Elton',
		'Fabiano',
		'Gabriel',
		'Helder',
		'Ibson',
		'Juan',
		'Keirrison',
		'Lucas',
		'Marcos',
		'Nivaldo',
		'Osmar',
		'Paulo',
		'Quico',
		'Ronaldo',
		'Sandro',
		'Tiago',
		'Ubiratan',
		'Vitor',
		'Washington',
		'Xororó',
		'Yuri',
		'Zé'
  ]
  
  COMMON_SURNAMES = [
		'Silva',
		'Souza',
		'Santos',
		'Nunes',
		'Cerezo',
		'Forlan',
		'Freitas',
		'Soares',
		'Borges',
		'Alves',
		'Figueira',
		'Teixeira',
		'Junior',
		'Miranda',
		'Cardoso'
  ]
  
  def NameGenerator.random_name
    "#{COMMON_NAMES.sample} #{COMMON_SURNAMES.sample}"
  end
end