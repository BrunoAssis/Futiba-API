<?php
class Player
{
	private $_name = '';
	private $_number = '';
	private $_offense = 0;
	private $_defense = 0;
	private $_stamina = 0;

	public function __construct($defaultStrength = null, $position = null)
	{
		$this->_getRandom($defaultStrength, $position);
	}

	private function _getRandom($defaultStrength = null, $position = null)
	{
		$this->_name = NameGenerator::getRandom();

		if ($position == 'G') {
			$this->_number = 1;
			$this->_offense = array_rand(array(0, 0, 0, 0, 0, 0, 2, 3, 3, 7));
			$this->_defense = ($defaultStrength != null ? $defaultStrength : rand(8, 10));
			$this->_stamina = ($defaultStrength != null ? $defaultStrength : rand(0, 10));
		} else {
			$this->_number = rand(1, 99);
			$this->_offense = ($defaultStrength != null ? $defaultStrength : rand(0, 10));
			$this->_defense = ($defaultStrength != null ? $defaultStrength : rand(0, 10));
			$this->_stamina = ($defaultStrength != null ? $defaultStrength : rand(0, 10));
		}
	}

	public function getOffense()
	{
		return $this->_offense;
	}

	public function getDefense()
	{
		return $this->_defense;
	}

	public function getStamina()
	{
		return $this->_stamina;
	}
}
