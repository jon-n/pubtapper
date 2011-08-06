class Game < ActiveRecord::Base

	has_one :master_event
	has_one :venue
	
end
