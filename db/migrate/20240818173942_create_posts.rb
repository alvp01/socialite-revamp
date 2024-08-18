class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :group, foreign_key: true, null: true

      t.timestamps
    end
  end
end
