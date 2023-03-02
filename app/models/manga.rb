class Manga < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :saga, presence: true
  validates :volume, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { maximum: 250 }
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_saga_and_description,
                  against: %i[saga description],
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
