class Trip < ActiveRecord::Base
  belongs_to :user
  geocoded_by :city
  before_validation :geocode
  validates_presence_of :start_date, :end_date, :city, :radius
  has_many :trip_games
  has_many :games, through: :trip_games

  def coordinates
    [latitude, longitude]
  end

  def potential_games
    @games ||= Game.for_trip(self)
  end
end
