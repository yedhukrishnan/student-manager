class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.json :total_hours
      t.json :student_hours
      t.json :percentage
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
