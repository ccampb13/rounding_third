class ScheduleSyncService < BaseSyncService
  class << self
    def sync
      sync_using :get_schedule, Game do |game, incoming_game|
        game.home_team = Team.where(external_id: incoming_game['home']).first
        game.away_team = Team.where(external_id: incoming_game['visitor']).first
        game.venue = Venue.where(external_id: incoming_game['venue']).first
        game.first_pitch_at = incoming_game['scheduled_start']
      end
    end
  end
end
