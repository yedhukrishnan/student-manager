class TimeTable < ApplicationRecord
  belongs_to :admin

  attr_accessor :table_string
end
