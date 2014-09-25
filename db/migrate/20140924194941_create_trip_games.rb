class CreateTripGames < ActiveRecord::Migration
  def change
    create_table :trip_games do |t|
      t.references :trip, index: true
      t.references :game, index: true

      t.timestamps
    end
  end
end
