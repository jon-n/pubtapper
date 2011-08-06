class MasterEvent < ActiveRecord::Base

	# multiple teams playing in the game
	has_many :participants
	# participant mapping to the teams
	has_many :teams, :through => :participants
	# games are the sub-events
	has_many :games
	
end
