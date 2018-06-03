class Translation < ApplicationRecord
  validates :word, :result, presence: true
end
