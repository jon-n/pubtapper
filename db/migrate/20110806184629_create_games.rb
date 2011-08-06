class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.date :date
      t.time :time
      t.integer :venue_id
      t.integer :sport_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
