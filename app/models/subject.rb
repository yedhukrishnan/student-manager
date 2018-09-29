class Subject < ApplicationRecord
  belongs_to :admin
  validates :name, :code, presence: true
end
