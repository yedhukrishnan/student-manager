class Student < ApplicationRecord
  belongs_to :admin
  has_many :leaves
  
  validates :name, :roll_no, :admission_no, presence: true
end