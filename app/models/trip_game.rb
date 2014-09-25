class TripGame < ActiveRecord::Base
  belongs_to :trip
  belongs_to :game
end
