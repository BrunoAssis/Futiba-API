<?php
class Match
{
	private $_verbose = false;
	
	private $_gameLength = 90;
	private $_homeTeam;
	private $_awayTeam;
	private $_homeScore = 0;
	private $_awayScore = 0;
	private $_teamInPossession = 0;
	private $_currentFieldSection = 0;

	private $_fieldChangingRate = array(60, 40, 5);
	
	//TODO: Analisar melhor se 12% de chance de falta por minuto é um valor muito alto ou não.
	private $_foulRate = 12;
	private $_foulGoalRate = 3;
	private $_foulCount = 0;

	public function __construct()
	{
		$this->_homeTeam = new Team;
		$this->_awayTeam = new Team;
		$this->_teamInPossession = (mt_rand(0, 100) < 50 ? 0 : 1);
		
		if ($this->_verbose) {
			echo 'AND THE GAME STARTS: ';
			var_dump($this->_teamInPossession);
		}
	}

	public function setVerbose($verbose)
	{
		$this->_verbose = $verbose;
	}

	private function _definePossession()
	{
		$attackingTeam = ($this->_teamInPossession == 0 ? $this->_homeTeam : $this->_awayTeam);
		$defendingTeam = ($this->_teamInPossession == 1 ? $this->_homeTeam : $this->_awayTeam);

		if ($this->_verbose) {
			echo 'WHO\'S ATTACKING? ' . $this->_teamInPossession . "\n";
			echo 'WHO\'S DEFENDING? ' . !$this->_teamInPossession . "\n";
		}
	
		//TODO BRUNO:
		//TODO Acho que temos que considerar o getOffensivePower() do time atacante também.	
		$maintainPossessionRate = ($attackingTeam->getStamina() * 100 / ($defendingTeam->getDefensivePower() + $defendingTeam->getStamina()));
		
		if ($this->_verbose) {
			echo 'WHAT\'S THE MAINTAIN POSSESSION RATE? ' . $maintainPossessionRate . "\n";
		}
		
		$this->_teamInPossession = (mt_rand(0, 100) < $maintainPossessionRate ? $this->_teamInPossession : !$this->_teamInPossession);
		
		if ($this->_verbose) {
			echo 'WHO\'S THE NEW ATTACKING TEAM? ' . $this->_teamInPossession . "\n";
		}
	}
	
	private function _depleteStamina()
  {
    #TODO BRUNO:
    #TODO A resistência está sendo diminuída do time como um todo, acho melhor
    #TODO diminui-la por jogador.
		$attackingTeam = ($this->_teamInPossession == 0 ? $this->_homeTeam : $this->_awayTeam);
		$defendingTeam = ($this->_teamInPossession == 1 ? $this->_homeTeam : $this->_awayTeam);
		
    $attackingTeam->setStamina($attackingTeam->getStamina() - 0.5);
		$defendingTeam->setStamina($defendingTeam->getStamina() - 0.3);
	}
	
	private function _foul()
	{
		if (mt_rand(0, 100) < $this->_foulRate) {
			#TODO BRUNO:
			#TODO Lógica da falta em si, quebrar jogador, tomar amarelo, ser expulso, etc.

			$this->_foulCount++;

			// At each four fouls, one minute is added to the total game length.
			if ($this->_foulCount % 4 == 0) {
				$this->_addOvertime(1);
			}
			
			#TODO: Analisar se todas as batidas de falta da segunda seção serão tentativas de gol.
			//if the foul is in the second section the team tries to score.
			if (abs($this->_currentFieldSection) == 2) {
				if (mt_rand(0, 100) < $this->_foulGoalRate) {
					$this->_goal(3);
				}
			}
			
		}
	}

	private function _possessingTeamAttacks()
	{
		$attackingTeam = ($this->_teamInPossession == 0 ? $this->_homeTeam : $this->_awayTeam);
		$defendingTeam = ($this->_teamInPossession == 1 ? $this->_homeTeam : $this->_awayTeam);
	
		if ($this->_verbose) {
			echo 'WE\'RE AT FIELD SECTION: ' . $this->_currentFieldSection . "\n";
			echo 'THERE\'S A CHANCE OF CHANGING TO THE NEXT SECTION: ' .$this->_fieldChangingRate[$this->_currentFieldSection] . "\n";
		}
		
		$naturalRate = $this->_fieldChangingRate[abs($this->_currentFieldSection)];
		$difference = $attackingTeam->getOffensivePower() - $defendingTeam->getDefensivePower();
		$percentage = '.' . sprintf("%02s", abs($difference));
		
		if($difference<=0){
			$changeSectionRate = $naturalRate - ($naturalRate * $percentage); 
		}else{
			$changeSectionRate = $naturalRate + ($naturalRate * $percentage); 
		}
		
		if (mt_rand(0, 100) < $changeSectionRate) {
			$this->_currentFieldSection += ($this->_teamInPossession == 0 ? 1 : -1);
		}

		if ($this->_verbose) {
			echo 'AFTER THE ATTACK, WE\'RE AT FIELD SECTION: ' . $this->_currentFieldSection . "\n";
		}
		
		if (abs($this->_currentFieldSection) == 3) {
			$this->_goal(3);
		}
  }
  
  private function _goal($fieldSection)
  {
	echo 'GOAL!' . "\n";
	if ($this->_teamInPossession == 0) {
		$this->_homeScore += 1;
	} else {
		$this->_awayScore += 1;
	}
	$this->_currentFieldSection = 0;
	$this->_teamInPossession = !($this->_teamInPossession);
  }

  private function _addOvertime($minutes)
  {
    $this->_gameTime += $minutes;
  }

	public function getScore()
	{
		for ($minute=0; $minute <= $this->_gameLength; $minute++) {
			if ($this->_verbose) {
				echo 'MINUTE ' . $minute . "\n";
			}
			$this->_definePossession();
			$this->_possessingTeamAttacks();
			$this->_depleteStamina();
			$this->_foul();
		}
		return array($this->_homeScore, $this->_awayScore);
	}

	public function describe()
	{
		echo "HOME TEAM OFF/DEF/STAM TOTAL POWER:" . $this->_homeTeam->getOffensivePower() . " / " . $this->_homeTeam->getDefensivePower() . " / " . $this->_homeTeam->getStamina() . " / " . ($this->_homeTeam->getOffensivePower() + $this->_homeTeam->getDefensivePower()) . "\n";
		echo "AWAY TEAM OFF/DEF/STAM TOTAL POWER:" . $this->_awayTeam->getOffensivePower() . " / " . $this->_awayTeam->getDefensivePower() . " / " . $this->_awayTeam->getStamina() . " / " . ($this->_awayTeam->getOffensivePower() + $this->_awayTeam->getDefensivePower()) . "\n";
		$score = $this->getScore();
		echo "FINAL\n";
		echo "HOME TEAM FINAL STAMINA:" . $this->_homeTeam->getStamina() . "\n";
		echo "AWAY TEAM FINAL STAMINA:" . $this->_awayTeam->getStamina() . "\n";
		echo "=====\n";
		echo 'HOME TEAM: ' . $score[0] . "\n";
		echo 'AWAY TEAM: ' . $score[1] . "\n";
	}
}
