class CalendarController < ApplicationController
  def index
    @week_offset = params[:week_offset].to_i
    @current_week_start = calculate_week_start(@week_offset)
    @week_days = generate_week_days(@current_week_start)
  end

  private

  def calculate_week_start(offset)
    today = Date.current
    start_of_week = today.beginning_of_week(:sunday)
    start_of_week + offset.weeks
  end

  def generate_week_days(week_start)
    today = Date.current
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
end
