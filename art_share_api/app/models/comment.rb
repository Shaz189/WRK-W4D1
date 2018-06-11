# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  text       :string           not null
#

class Comment < ApplicationRecord
  validates :author_id, :artwork_id, presence: true
  validates :text, presence: true

  belongs_to :author,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :artwork
end
