class AddMasterEventIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :master_event_id, :integer
  end

  def self.down
    remove_column :games, :master_event_id
  end
end
