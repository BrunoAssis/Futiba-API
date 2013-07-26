<?php
class NameGenerator
{
	private static $_commonNames = array(
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
	);

	private static $_commonSurnames = array(
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
	);

	public static function getRandom()
	{
		return self::$_commonNames[array_rand(self::$_commonNames)] . ' ' . self::$_commonSurnames[array_rand(self::$_commonSurnames)];
	}
}
