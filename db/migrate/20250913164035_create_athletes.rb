class CreateAthletes < ActiveRecord::Migration[8.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :grade

      t.timestamps
    end
  end
end
