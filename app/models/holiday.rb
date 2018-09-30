class Holiday < ApplicationRecord
  belongs_to :admin

  validates :date, presence: true
end
