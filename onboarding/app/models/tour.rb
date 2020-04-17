class Tour < ApplicationRecord
  has_and_belongs_to_many :customers
  validates :start_time, presence: true,
          length: { minimum: 5  }
end
