class UsersController < AuthenticatedController
  # load_and_authorize_resource //to use if cancan is added


  def show
    @user = User.find(params[:id])
  end
end
