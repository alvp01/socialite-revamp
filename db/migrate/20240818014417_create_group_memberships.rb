class CreateGroupMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :group_memberships do |t|
      t.references :group, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
