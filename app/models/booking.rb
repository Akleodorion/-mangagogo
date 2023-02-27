class Booking < ApplicationRecord
  belongs_to :manga
  belongs_to :user
end
