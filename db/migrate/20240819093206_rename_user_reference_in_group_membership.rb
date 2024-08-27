class RenameUserReferenceInGroupMembership < ActiveRecord::Migration[7.1]
  def change
    rename_column :group_memberships, :user_id, :member_id
  end
end
