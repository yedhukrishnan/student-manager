class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :roll_no
      t.string :admission_no
      t.string :ktu_id
      t.references :admin

      t.timestamps
    end
  end
end
