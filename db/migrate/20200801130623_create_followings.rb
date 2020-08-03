class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :FollowerId
      t.integer :FollowedId

      t.timestamps
    end
  end
end
