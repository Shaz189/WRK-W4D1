# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks

  has_many :artwork_shares

  has_many :shared_artworks,
  through: :artwork_shares,
  source: :artwork

  has_many :comments,
  foreign_key: :author_id,
  class_name: :Comment,
  dependent: :destroy
end
