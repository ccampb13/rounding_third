class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :first_pitch_at
      t.uuid :external_id

      t.timestamps
    end
  end
end
