class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :athlete_events, dependent: :destroy
  has_many :athletes, through: :athlete_events
end
