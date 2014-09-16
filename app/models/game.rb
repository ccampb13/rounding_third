class Game < ActiveRecord::Base
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  belongs_to :venue

  scope :near, ->(location, *args) {
    venue_sql = Venue.near(location, *args).to_sql

    joins("INNER JOIN (#{venue_sql}) AS venues ON venues.id = games.venue_id")
  }

  delegate :name, to: :home_team, prefix: true
  delegate :name, to: :away_team, prefix: true
  delegate :name, to: :venue, prefix: true

  scope :with_relations, -> { includes(:home_team, :away_team, :venue) }
  scope :for_trip, ->(trip, radius = 50) { order(:first_pitch_at).with_relations.within(trip.start_date, trip.end_date).near(trip.coordinates, radius) }
  scope :within, ->(start_date, end_date) { where(first_pitch_at: (start_date..end_date)) }
end
