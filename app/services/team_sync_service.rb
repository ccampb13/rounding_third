class TeamSyncService < BaseSyncService
  class << self
    def sync
      sync_using :get_teams, Team do |team, incoming_team|
        team.name = incoming_team['name']
      end
    end
  end
end
