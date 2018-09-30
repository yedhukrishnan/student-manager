class AddOccasionToHolidays < ActiveRecord::Migration[5.2]
  def change
  	add_column :holidays, :occasion, :string
  end
end
