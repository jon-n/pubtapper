class AddTitleToMasterEvents < ActiveRecord::Migration
  def self.up
    add_column :master_events, :title, :string
  end

  def self.down
    remove_column :master_events, :title
  end
end
