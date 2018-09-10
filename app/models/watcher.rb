class Watcher < ApplicationRecord
  validates :name, :url, :timer, presence: true
  validates :timer, numericality: { greater_than: 0 }
end
