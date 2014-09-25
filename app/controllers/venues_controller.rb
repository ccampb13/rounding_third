class VenuesController < AuthenticatedController
  before_action :authenticate_user!, except: [:index]

  def index
    @venues = Venue.all
  end

end
