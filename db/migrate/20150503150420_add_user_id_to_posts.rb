class AddUserIdToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.integer :user_id
    end
  end

  def add_timestamps_to_posts
    add_timestamps :posts
  end
end
