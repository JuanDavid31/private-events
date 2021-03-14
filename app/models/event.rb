class Event < ApplicationRecord
  belongs_to :user, foreign_key: :creator_id
  validates :description, presence: true
  has_and_belongs_to_many :attendees, join_table: 'users_events', class_name: 'User'
end
