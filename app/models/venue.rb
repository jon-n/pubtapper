class Venue < ActiveRecord::Base

	has_many :games
	has_many :master_events, :through => :games
	
end
