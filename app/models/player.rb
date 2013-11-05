class Player < ActiveRecord::Base
  belongs_to :real_team
  
  has_many :teams, through: :contracts
  
  validates :name, presence: true
  validates :number, presence: true
  validates :position, inclusion: {in: %w(G D M O)}
  validates :real_team_id, presence: true
  
  validates :offense, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :defense, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :stamina, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
end