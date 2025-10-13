class Workout < ApplicationRecord
  validates :date, presence: true
  validates :title, presence: true

  has_many :event_workouts, dependent: :destroy
  has_many :events, through: :event_workouts
  has_many :athlete_workouts, dependent: :destroy
  has_many :athletes, through: :athlete_workouts
end
