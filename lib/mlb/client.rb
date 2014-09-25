module MLB
  class Client
    attr_reader :connection

    def initialize(access_level: 't', version: '4', api_key: 'uf38chewnqwpzct6ghkettzr')
      @connection = Connection.new(access_level, version, api_key)
    end

    def get_schedule(year = Date.today.year)
      variable_name = "@schedule_#{year}"
      value = instance_variable_get(variable_name) || instance_variable_set(variable_name, get(:get_schedule_for_year, year))
      value['calendars']['event']
    end

    def get_teams
      unless @teams
       rankings = get :get_rankings_for_year, Date.today.year
       @teams = rankings['rankings']['league'].flat_map {|l| l['division'].flat_map {|d| d['team'] }}
     end

     @teams
   end

    def get_venues
      @venues ||= get :get_venues
      @venues['venues']['venue']
    end

    protected

    def get(connection_method, *args)
      res = connection.send connection_method, *args

      if res.success?
        Hash.from_xml(res.body)
      else
        raise Exception.new 'No bueno'
      end
    end
  end
end
