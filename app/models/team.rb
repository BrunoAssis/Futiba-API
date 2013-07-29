class Team < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  belongs_to :user
  
  has_many :home_matches, :class_name => 'Match', :foreign_key => :home_team_id
  has_many :away_matches, :class_name => 'Match', :foreign_key => :away_team_id
  
  def self.matches
    Team.home_matches + Team.away_matches
  end
end
