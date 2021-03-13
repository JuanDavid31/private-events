class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..15 }
  has_many :events
end
