class CreateMasterEvents < ActiveRecord::Migration
  def self.up
    create_table :master_events do |t|
      t.time :time
      t.date :date
      t.integer :sport_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :master_events
  end
end
