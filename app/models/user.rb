class User < ApplicationRecord
  has_many :opinions, foreign_key: 'AuthorId', class_name: 'Opinion'
  has_many :likes, foreign_key: 'UserId', class_name: 'Like'
  has_many :followed, foreign_key: 'FollowerId', class_name: 'Following'
  has_many :followers, foreign_key: 'FollowedId', class_name: 'Following'
  before_save { self.Username = self.Username.downcase }
  validates :Username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
  validates :Fullname, presence: true, length: { minimum: 3, maximum: 100 }
  mount_uploader :Photo, ImageUploader
  mount_uploader :CoverImage, ImageUploader

  def self.user_followers(id, current_user_id)
    Following.where(FollowedId: id).where.not(FollowerId: current_user_id).order(created_at: :desc).limit(5)
  end

  def self.all_users(user_id)
    User.where('id != ?', user_id)
  end
end
