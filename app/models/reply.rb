class Reply < ApplicationRecord
  validates :app_id, presenece: true
  validates :content, presenece: true
  validates :user_name, presenece: true
end
