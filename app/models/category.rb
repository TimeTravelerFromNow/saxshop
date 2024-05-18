class Category < ApplicationRecord
  include ReservedSlugs
  validates :slug, exclusion: { in: RESERVED_SLUGS }
  validates(:slug, :title, presence: true)
  validates_uniqueness_of :slug

  def to_param
    slug
  end
end
