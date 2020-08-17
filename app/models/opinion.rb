class Opinion < ApplicationRecord
  belongs_to :Author, foreign_key: 'AuthorId', class_name: 'User'
  has_many :likes, foreign_key: 'OpinionId', class_name: 'Like'

  validates :Text, presence: true, length: { minimum: 3, maximum: 250 }

  scope :ordered_by_most_recent, -> { order(created_at: :desc).limit(3) }
end
