class VenuesController < AuthenticatedController

  def index
    @venues = Venue.all
  end

end
