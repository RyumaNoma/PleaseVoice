class App < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validates :exp, presence: true
end
