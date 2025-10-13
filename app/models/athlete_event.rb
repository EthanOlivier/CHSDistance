class AthleteEvent < ApplicationRecord
  belongs_to :athlete
  belongs_to :event

  validate :short_hurdles

  private

  def short_hurdles
    return unless athlete&.gender && event&.name

    case event.name
    when "100m Hurdles"
      errors.add(:event, "100m Hurdles is only for female athletes") unless athlete.gender_female?
    when "110m Hurdles"
      errors.add(:event, "110m Hurdles is only for male athletes") unless athlete.gender_male?
    end
  end
end
