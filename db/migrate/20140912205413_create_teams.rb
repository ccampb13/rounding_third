class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.uuid :external_id

      t.timestamps
    end
  end
end
