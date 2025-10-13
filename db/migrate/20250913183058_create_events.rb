class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_enum :event_name, [ "100m", "200m", "400m", "800m", "1600m", "3200m", "100m Hurdles", "110m Hurdles", "300m Hurdles", "4x100m", "4x400m", "4x800m", "Pole Vault", "High Jump", "Long Jump", "Triple Jump", "Javelin", "Discus", "Shot Put" ]
    create_table :events do |t|
      t.enum :name, enum_type: :event_name, null: false
      t.timestamps
    end
  end
end
