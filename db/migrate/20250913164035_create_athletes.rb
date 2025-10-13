class CreateAthletes < ActiveRecord::Migration[8.0]
  def change
    create_enum :gender_name, [ "male", "female" ]
    create_table :athletes do |t|
      t.string :name, null: false
      t.integer :grade
      t.enum :gender, enum_type: :gender_name, null: false

      t.timestamps
    end
  end
end
