class Song < ApplicationRecord
  belongs_to :artist
  validates :title, presence: true
validates :song_url, presence: true
end
