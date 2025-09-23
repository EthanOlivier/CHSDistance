class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :ensure_profile_selected

  private

  def ensure_profile_selected
    return if session[:profile_name].present?

    session[:profile_name] = Athlete.find_by(name: "Overview").name
  end
end
