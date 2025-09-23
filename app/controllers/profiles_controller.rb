class ProfilesController < ApplicationController
  before_action :set_current_profile, only: :index

  def index
    @profiles = Athlete.all.pluck(:name)
  end

  def select
    name = params[:name]
    session[:profile_name] = name
    redirect_back fallback_location: profiles_path, notice: "Profile set to #{name}."
  end

  private

  def set_current_profile
    @current_profile = session[:profile_name]
  end
end
