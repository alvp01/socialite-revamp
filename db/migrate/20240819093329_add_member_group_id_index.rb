class AddMemberGroupIdIndex < ActiveRecord::Migration[7.1]
  def change
    add_index :group_memberships, %i[member_id group_id], unique: true
  end
end
