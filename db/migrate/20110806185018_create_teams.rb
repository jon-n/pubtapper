class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :sport_id
      t.text :description
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :teams
  end
end
