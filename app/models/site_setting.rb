class SiteSetting < ApplicationRecord
  has_rich_text :about
  has_one_attached :portrait

  scope :active, -> { self.first  }

  def self.about
    about = active.about if active.present?
    about ||= 'I buy, sell, repair and trade band instruments of all kinds.'
  end

  def self.portrait
    portrait_image = active.portrait if active.present? && active.portrait.persisted?
    portrait_image ||= 'STEVE_PORTRAIT.png'
  end

  def self.contact
    email = active.contact if active.present?
    email ||= 'saxgray@gmail.com'
  end

  def self.motd
    motd = active.motd if active.present?
    motd ||= 'Welcome to SteveGraySaxes!'
  end
end
