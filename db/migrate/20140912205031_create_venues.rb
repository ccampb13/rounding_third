class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.uuid :external_id

      t.timestamps
    end
  end
end
