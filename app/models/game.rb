class Game < ActiveRecord::Base

	belongs_to :master_event
	belongs_to :venue
	
	def as_json(options={})
		super(:include => [:venue, :master_event])
	end
	
end
