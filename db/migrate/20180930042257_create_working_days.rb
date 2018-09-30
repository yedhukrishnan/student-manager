class CreateWorkingDays < ActiveRecord::Migration[5.2]
  def change
    create_table :working_days do |t|
      t.datetime :date
      t.integer :weekday
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
