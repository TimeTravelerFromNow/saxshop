class Instrument < ApplicationRecord
  belongs_to :make, optional: true
  has_one :flickr_photo, dependent: :destroy
end
