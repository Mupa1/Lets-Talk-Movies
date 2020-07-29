class User < ApplicationRecord
  validates :Username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
  validates :Fullname, presence: true, length: { minimum: 3, maximum: 100 }
end
