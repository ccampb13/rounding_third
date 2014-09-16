module MLB
  class Connection < Faraday::Connection
    attr_accessor :access_level, :api_key, :version

    def initialize(access_level, version, api_key, options = {}, &block)
      @access_level = access_level # t Trial, p Production
      @version = version
      @api_key = api_key

      options.merge! url: 'http://api.sportsdatallc.org'

      if block_given?
        super(options, &block)
      else
        super(options) do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end

    def get_rankings_for_year(year)
      get "rankings/#{year}"
    end

    def get_schedule_for_year(year)
      get "schedule/#{year}"
    end

    def get_venues
      get 'venues/venues'
    end

    def base_path
      "/mlb-#{access_level}#{version}"
    end

    def get(path, options = {})
      super format_path(path), options.merge(api_key: api_key)
    end

    protected

    def format_path(path)
      "#{base_path}/#{path}.xml"
    end
  end
end
