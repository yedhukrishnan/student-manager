class Leave < ApplicationRecord
  belongs_to :student

  validates :student_id, :date, presence: true

  enum weekday: %w[monday tuesday wednesday thursday friday]
end
