class Reply < ApplicationRecord
  validates :app_id, presence: true
  validates :content, presence: true
  validates :user_name, presence: true
end
