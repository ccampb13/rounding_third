class UsersController < AuthenticatedController



  def show
    @user = User.find(params[:id])
    @trips = current_user.trips.all
  end
end
