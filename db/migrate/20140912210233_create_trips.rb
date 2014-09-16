class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :city
      t.float :latitude
      t.float :longitude
      t.references :user, index: true

      t.timestamps
    end
  end
end
