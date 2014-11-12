class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new
    @trip = Trip.new
  end

  def index
    @trips = current_user.trips.all
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      flash.now[:notice] = "Your trip has been saved."
      redirect_to edit_trip_path(@trip)
    else
      flash.now[:alert] = "Your trip could not be created."
      render 'new'
    end
  end

  def show
    @trip = current_user.trips.find(params[:id])
    @games = @trip.games.group_by { |game| game.first_pitch_at.to_date }
  end

   def edit
    @trip = current_user.trips.find(params[:id])
    @potential_games = @trip.potential_games.group_by { |game| game.first_pitch_at.to_date }
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
    params.require(:trip).permit(:start_date, :end_date, :city, :name, :radius, game_ids: [])
  end
end
