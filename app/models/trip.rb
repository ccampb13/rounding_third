class Trip < ActiveRecord::Base
  belongs_to :user
  geocoded_by :city
  before_validation :geocode, unless: :geocoded?
  validates_presence_of :start_date, :end_date, :city

  def coordinates
    [latitude, longitude]
  end

  def games(radius = 200)
    @games ||= {}
    @games[radius] ||= Game.for_trip(self, radius)
  end
end
