class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.text :address
      t.string :url
      t.float :latitude
      t.float :longitude
      t.string :data_source_id
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :telephone

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
