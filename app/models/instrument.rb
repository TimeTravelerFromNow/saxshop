class Instrument < ApplicationRecord
  belongs_to :make, optional: true
  has_one :flickr_photo, dependent: :nullify

  def deletion_message
    del_message = {}
    if self.flickr_photo.present?
      del_message = {turbo_confirm: 'are you sure? flickr_photo will be unassigned.'}
    end
  end
end
