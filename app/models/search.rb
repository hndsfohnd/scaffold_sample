class Search < ApplicationRecord
  validates :amadeus, presence: true
  validates :description, presence: true
end
