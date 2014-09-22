class TripsController < ApplicationController
  before_action :authenticate_user!

  def new
    @trip = Trip.new
  end

  def index
    @trips = current_user.trips.all
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      flash.now[:notice] = "Your trip has been saved."
      redirect_to trips_path
    else
      flash.now[:alert] = "Your trip could not be created."
      render 'new'
    end
  end

  def show
    @trip = current_user.trips.find(params[:id])
    @games = Game.for_trip(@trip, radius = 200)
  end

   def edit
    @trip = current_user.trips.find_by_id(params[:id])
    if @trip.nil?
      flash.notice = "The trip could not be found."
      redirect_to trip_path
    end
  end

   def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash.notice = "Trip was successfully updated!"
      redirect_to trip_path
    else
      flash.notice = "Your changes could not be saved."
      render 'edit'
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy!
    flash.notice = "Your trip has been deleted."
    redirect_to trips_path
  end

  private

    def trip_params
      params.require(:trip).permit(:start_date, :end_date, :city, :name)
    end
end
