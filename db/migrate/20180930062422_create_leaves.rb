class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :reason
      t.datetime :date
      t.integer :weekday
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
