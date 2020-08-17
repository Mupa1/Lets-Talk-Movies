class User < ApplicationRecord
  has_many :opinions, foreign_key: 'AuthorId', class_name: 'Opinion', dependent: :destroy
  has_many :likes, foreign_key: 'UserId', class_name: 'Like', dependent: :destroy
  has_many :followed, foreign_key: 'FollowerId', class_name: 'Following', dependent: :destroy
  has_many :followers, foreign_key: 'FollowedId', class_name: 'Following', dependent: :destroy
  before_save { self.Username = self.Username.downcase }
  validates :Username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
  validates :Fullname, presence: true, length: { minimum: 3, maximum: 100 }
  mount_uploader :Photo, ImageUploader
  mount_uploader :CoverImage, ImageUploader

  def self.user_followers(id, current_user_id)
    Following.where(FollowedId: id).where.not(FollowerId: current_user_id).order(created_at: :desc).limit(5)
  end

  def self.all_users_except_me(user_id)
    User.where.not(id: user_id).order('created_at DESC')
  end

  def follow_suggestions
    (User.all - followed - [User.find(id)])[0..2]
  end
end
