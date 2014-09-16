class Trip < ActiveRecord::Base
  belongs_to :user
  geocoded_by :city
  before_validation :geocode, unless: :geocoded?

  def coordinates
    [latitude, longitude]
  end

  def games(radius = 50)
    @games ||= {}
    @games[radius] ||= Game.for_trip(self, radius)
  end
end
