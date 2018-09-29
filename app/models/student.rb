class Student < ApplicationRecord
  belongs_to :admin
  validates :name, :roll_no, :admission_no, presence: true
end