class Manga < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :saga, presence: true
  validates :volume, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 50, maximum: 250 }
  validates :photo, presence: true
end
