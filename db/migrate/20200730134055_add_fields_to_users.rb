class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Photo, :string
    add_column :users, :CoverImage, :string
  end
end
