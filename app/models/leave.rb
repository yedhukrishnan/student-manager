class Leave < ApplicationRecord
  belongs_to :student

  enum weekday: %w[monday tuesday wednesday thursday friday]
end
