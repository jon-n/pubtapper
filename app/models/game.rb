class Game < ActiveRecord::Base

	belongs_to :master_event
	belongs_to :venue
	
end
