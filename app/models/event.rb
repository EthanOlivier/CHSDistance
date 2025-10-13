class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum :name, {
    "100m" => "100m",
    "200m" => "200m",
    "400m" => "400m",
    "800m" => "800m",
    "1600m" => "1600m",
    "3200m" => "3200m",
    "100m_hurdles" => "100m Hurdles",
    "110m_hurdles" => "110m Hurdles",
    "300m_hurdles" => "300m Hurdles",
    "4x100m" => "4x100m",
    "4x400m" => "4x400m",
    "4x800m" => "4x800m",
    "pole_vault" => "Pole Vault",
    "high_jump" => "High Jump",
    "long_jump" => "Long Jump",
    "triple_jump" => "Triple Jump",
    "javelin" => "Javelin",
    "discus" => "Discus",
    "shot_put" => "Shot Put"
  }, prefix: true

  has_many :athlete_events, dependent: :destroy
  has_many :athletes, through: :athlete_events
  has_many :event_workouts, dependent: :destroy
  has_many :workouts, through: :event_workouts
end
