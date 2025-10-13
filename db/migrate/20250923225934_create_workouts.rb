class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.date :date, null: false
      t.string :title, null: false
      t.text :description

      t.timestamps
    end

    create_join_table :workouts, :events do |t|
      t.index :workout_id
      t.index :event_id
      t.index [ :workout_id, :event_id ], unique: true
    end

    create_join_table :workouts, :athletes do |t|
      t.index :workout_id
      t.index :athlete_id
      t.index [ :workout_id, :athlete_id ], unique: true
    end
  end
end
