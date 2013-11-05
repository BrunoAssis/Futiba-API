class PopulateRealTeamsAndPlayers < ActiveRecord::Migration
  def up
    require 'name_generator'

    real_teams = {
      "São Paulo" => ["São Pedro", "#ff0000", "#ffffff", "#000000"],
      "Palmeiras" => ["Coqueiros", "#00ff00", "#ffffff", "#ffffff"],
      "Internacional" => ["Nacional", "#ff0000", "#ffffff", "#ffffff"]
    }

    real_teams.each do |name, data|
      team = RealTeam.create(name: name, fun_name: data[0], main_color: data[1], secondary_color: data[2], third_color: data[3])

      # Goalkeeper
      Player.create(real_team: team, name: NameGenerator.random_name, number: 1, position: 'G', offense: [0, 0, 0, 0, 0, 0, 2, 3, 3, 7].sample, defense: rand(8..10), stamina: rand(5..10))

      # Defense
		  4.times do
        Player.create(real_team: team, name: NameGenerator.random_name, number: rand(2..6), position: 'D', offense: [0, 0, 0, 0, 0, 0, 2, 3, 4, 6].sample, defense: rand(6..10), stamina: rand(5..10))
      end

      # Midfield
      3.times do
        Player.create(real_team: team, name: NameGenerator.random_name, number: rand(5..8), position: 'M', offense: rand(3..9), defense: rand(3..9), stamina: rand(5..10))
      end

      # Offense
		  3.times do
        Player.create(real_team: team, name: NameGenerator.random_name, number: rand(9.11), position: 'O', offense: rand(6..10), defense: [0, 0, 0, 0, 0, 0, 2, 3, 4, 6].sample, stamina: rand(5..10))
      end
    end
  end
  
  def down
      RealTeam.destroy_all
      Player.destroy_all
  end
end
