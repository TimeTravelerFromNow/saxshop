class Instrument < ApplicationRecord
  belongs_to :make, optional: true
  has_one :flickr_photo, dependent: :destroy

  def deletion_message
    del_message = {}
    if self.flickr_photo.present?
      del_message = {turbo_confirm: 'are you sure? destroys flickr_photo too.'}
    end
  end

  def year_or_year_est
    self.year || self.year_est
  end
end
