class Following < ApplicationRecord
  belongs_to :Follower, foreign_key: 'FollowerId', class_name: 'User'
  belongs_to :Followed, foreign_key: 'FollowedId', class_name: 'User'

  validates :FollowerId, presence: true
  validates :FollowedId, presence: true

  def self.find_friend_to_unfollow(sender_id, receiver_id)
    Following.where(FollowerId: sender_id).where(FollowedId: receiver_id)[0]
  end
end
