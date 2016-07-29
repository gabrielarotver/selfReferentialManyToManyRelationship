class CreateFollowers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :followers, id: false do |t|
      t.integer :user_id
      t.integer :follower_user_id
    end

    add_index(:followers, [:user_id, :follower_user_id], :unique => true)
    add_index(:followers, [:follower_user_id, :user_id], :unique => true)
  end

  def self.down
    remove_index(:followers, [:follower_user_id, :user_id])
    remove_index(:followers, [:user_id, :follower_user_id])
    drop_table :followers
  end
end
