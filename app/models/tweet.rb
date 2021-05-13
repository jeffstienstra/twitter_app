class Tweet < ApplicationRecord
  validates :text, presence: true
  validates :user_id, presence: true
end
