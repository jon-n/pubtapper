class AddMasterEventIdToVenue < ActiveRecord::Migration
  def self.up
	add_column :venues, :master_event_id, :integer
  end

  def self.down
  	remove_column :venues, :master_event_id
  end
end
