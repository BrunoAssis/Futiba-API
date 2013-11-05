class RealTeam < ActiveRecord::Base
  validates :name, presence: true
  validates :fun_name, presence: true
end
