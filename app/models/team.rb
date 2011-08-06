class Team < ActiveRecord::Base

	has_many :participants
	has_many :master_events, :through => :participants
	
end
