class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..15 }, uniqueness: true
  has_many :events, foreign_key: :creator_id
  has_and_belongs_to_many :attended_events, join_table: 'users_events', class_name: 'Event'
end
