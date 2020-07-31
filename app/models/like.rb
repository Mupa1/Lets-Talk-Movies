class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'UserId', class_name: 'User'
  belongs_to :opinion, foreign_key: 'OpinionId', class_name: 'Opinion'

  def self.find_user_like(user_id, opinion_id)
    Like.where(UserId: user_id).where(OpinionId: opinion_id)[0]
  end
end
