class Tour < ApplicationRecord
  has_many :customers
    validates :start_time, presence: true,
          length: { minimum: 5  }
end
