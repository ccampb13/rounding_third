class AddReferencesToGames < ActiveRecord::Migration
  def change
    remove_column :games, :home_team, :string
    remove_column :games, :away_team, :string
    add_reference :games, :home_team, index: true
    add_reference :games, :away_team, index: true
    add_reference :games, :venue, index: true
  end
end
