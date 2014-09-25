class Venue < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode, unless: :geocoded?
  has_many :games
end
