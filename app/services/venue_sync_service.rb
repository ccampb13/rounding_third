class VenueSyncService < BaseSyncService
  class << self
    def sync
      sync_using :get_venues, Venue do |venue, incoming_venue|
        venue.name = incoming_venue['name']
        venue.market = incoming_venue['market']
      end
    end
  end
end
