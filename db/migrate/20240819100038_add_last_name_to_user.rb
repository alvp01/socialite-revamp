class AddLastNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lastname, :string, default: ''
  end
end
