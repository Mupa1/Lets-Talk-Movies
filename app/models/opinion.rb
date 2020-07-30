class Opinion < ApplicationRecord
  belongs_to :Author, foreign_key: 'AuthorId', class_name: 'User'
  validates :Text, presence: true, length: { minimum: 3, maximum: 250 }
end
