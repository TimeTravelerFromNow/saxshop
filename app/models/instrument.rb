class Instrument < ApplicationRecord
  belongs_to :make, optional: true
end
