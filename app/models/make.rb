class Make < ApplicationRecord
  include ReservedSlugs
  validates :slug, exclusion: { in: RESERVED_SLUGS }
  validates(:slug, :title, presence: true)
  validates_uniqueness_of :slug

  belongs_to :category

  def to_param
    slug
  end
end
