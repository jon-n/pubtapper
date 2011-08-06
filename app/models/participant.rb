class Participant < ActiveRecord::Base

	belongs_to :master_event
	belongs_to :team
	
end
