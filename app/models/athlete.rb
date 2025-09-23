class Athlete < ApplicationRecord
  validates :name, presence: true

  has_many :athlete_events, dependent: :destroy
  has_many :events, through: :athlete_events
end
