class UsersController < ApplicationController
  # def index
  #   @users = User.all
  #   # the `geocoded` scope filters only users with coordinates (latitude & longitude)

  #   @markers = @users.geocoded.map do |user|
  #     {
  #       lat: user.latitude,
  #       lng: user.longitude
  #     }
  #   end


  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
