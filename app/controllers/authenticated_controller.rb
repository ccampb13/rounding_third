class AuthenticatedController < ApplicationController
  before_filter :authenticate_user!
  # check_authorization   //to use if cancan is added


end
