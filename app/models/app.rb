class App < ApplicationRecord
  validates :user_id, presenece: true
  validates :title, presenece: true
  validates :url, presenece: true
  validates :exp, presenece: true
end
