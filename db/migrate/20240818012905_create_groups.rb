class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name,         null: false, index: { unique: true }
      t.string :description,  default: ''
      t.references :admin,    null: false, foreign_key: { to_table: :users }
      t.string :cover_image,  default: ''

      t.timestamps
    end
  end
end
