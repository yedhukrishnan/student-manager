class CreateTimeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :time_tables do |t|
      t.json :table
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
