class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :Username
      t.string :Fullname

      t.timestamps
    end
  end
end
