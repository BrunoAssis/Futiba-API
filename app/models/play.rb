class Play < ActiveRecord::Base
  belongs_to :match
  belongs_to :play_type
  
  def description
    self.play_type.description.gsub(/{([0-9])+}/, self.involved.split(',')["\1".to_i])
  end
end
