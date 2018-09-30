class WorkingDay < ApplicationRecord
  belongs_to :admin

  validates :date, :weekday, presence: true

  enum weekday: %w[monday tuesday wednesday thursday friday]
end
