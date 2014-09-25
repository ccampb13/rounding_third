class AddRadiusColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :radius, :integer
  end
end
