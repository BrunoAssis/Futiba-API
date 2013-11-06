class Match < ActiveRecord::Base
  belongs_to :home_team, :class_name => 'Team', :foreign_key => :home_team_id
  belongs_to :away_team, :class_name => 'Team', :foreign_key => :away_team_id
  
  has_many :plays
  
  validates :date, presence: true
  validates :home_team, presence: true
  validates :away_team, presence: true

  validate :teams_are_not_the_same
  validate :teams_are_not_from_the_same_user
  
  def teams_are_not_the_same
    @errors.add(:away_team, "should not be the same as the home team") if self.home_team == self.away_team
  end
  
  def teams_are_not_from_the_same_user
    @errors.add(:away_team, "should not be from the same user as the home team") if self.home_team.user == self.away_team.user
  end
end