class Movie < ApplicationRecord
  has_one_attached :image
  has_many :movie_views
end
