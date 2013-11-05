class Player < ActiveRecord::Base
  belongs_to :real_team
  
  has_many :teams, through: :contracts
end
