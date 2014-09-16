class Venue < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode
  has_many :games
end
