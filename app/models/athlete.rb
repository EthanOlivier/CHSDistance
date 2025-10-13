class Athlete < ApplicationRecord
  validates :name, presence: true

  enum :gender, {
    male: "male",
    female: "female"
  }, prefix: true

  has_many :athlete_events, dependent: :destroy
  has_many :events, through: :athlete_events
  has_many :athlete_workouts, dependent: :destroy
  has_many :workouts, through: :athlete_workouts
end
