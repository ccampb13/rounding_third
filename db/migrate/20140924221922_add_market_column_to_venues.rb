class AddMarketColumnToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :market, :string
  end
end
