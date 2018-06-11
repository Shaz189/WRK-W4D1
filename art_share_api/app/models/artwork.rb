# == Schema Information
#
# Table name: artworks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  artist_id  :integer          not null
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :artist_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  def self.artwork_for_user(user_id)
    Artwork
      .left_outer_joins(:artwork_shares)
      .where("artwork_shares.viewer_id = :user_id or artworks.artist_id = :user_id", user_id: user_id)
      .distinct
    # join
    # artwork_shares on artwork
    # where
    # artwork_shares.viewer_id = user_id and artwork.artist_id = user_id

  end
end
