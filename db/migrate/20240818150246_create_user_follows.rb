class CreateUserFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :user_follows do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :user_follows, %i[follower_id followed_id], unique: true
  end
end
