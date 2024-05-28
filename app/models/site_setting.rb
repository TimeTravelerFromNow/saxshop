class SiteSetting < ApplicationRecord

  scope :active, -> { self.first  }

  def self.contact
    email = active.contact if active.present?
    email ||= 'saxgray@gmail.com'
  end

  def self.motd
    motd = active.motd if active.present?
    motd ||= 'Welcome to SteveGraySaxes!'
  end
end
