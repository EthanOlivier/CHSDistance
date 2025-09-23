class CalendarController < ApplicationController
  before_action :set_current_profile, only: :index

  def index
    @week_offset = params[:week_offset].to_i
    @current_week_start = calculate_week_start(@week_offset)
    @week_days = generate_week_days(@current_week_start)
  end

  private

  def set_current_profile
    @current_profile = session[:profile_name]
  end

  def calculate_week_start(offset)
    today = user_today
    start_of_week = today.beginning_of_week(:sunday)
    start_of_week + offset.weeks
  end

  def generate_week_days(week_start)
    today = user_today
    (0..6).map do |day_offset|
      date = week_start + day_offset.days
      {
        date: date,
        day_name: date.strftime("%A"),
        month_name: date.strftime("%B"),
        day_number: date.day,
        is_today: date == today
      }
    end
  end

  def user_today
    @user_today ||= user_now.to_date
  end

  def user_now
    @user_now ||= begin
      timezone_name = session[:time_zone].presence
      timezone = ActiveSupport::TimeZone[timezone_name] if timezone_name
      (timezone || Time.zone).now
    end
  end
end
