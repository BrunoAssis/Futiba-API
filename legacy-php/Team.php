<?php
class Team
{
	private $_players = array();
	private $_offensivePower = 0;
	private $_defensivePower = 0;
	private $_stamina = 0;

	public function __construct($defaultStrength=null)
	{
		$this->_players = $this->_getRandomTeam($defaultStrength);
	}

	private function _getRandomTeam($defaultStrength=null)
	{
		$team[1] = new Player($defaultStrength, 'G');
		for ($i=2; $i<=11; $i++) {
			$team[$i] = new Player($defaultStrength);
		}
		return $team;
	}

	public function getOffensivePower()
	{
		if ($this->_offensivePower == 0) {
			$this->_offensivePower = array_reduce($this->_players, function($totalOffPower, $player) {$totalOffPower += $player->getOffense(); return $totalOffPower;});
		}
		return $this->_offensivePower;
	}

	public function getDefensivePower()
	{
		if ($this->_defensivePower == 0) {
			$this->_defensivePower = array_reduce($this->_players, function($totalDefPower, $player) {$totalDefPower += $player->getDefense(); return $totalDefPower;});
		}
		return $this->_defensivePower;
	}
	
	public function getStamina()
	{
		if ($this->_stamina == 0) {
			$this->_stamina = array_reduce($this->_players, function($totalStamina, $player) {$totalStamina += $player->getStamina(); return $totalStamina;});
		}
		return $this->_stamina;
	}
	
	public function setStamina($stamina)
  {
    if ($stamina > 0) {
		  $this->_stamina = $stamina;
    }
	}
}
