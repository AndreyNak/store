class AddActiveToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :comment_likes, :active, :boolean, null: false, default: true
    add_index :comment_likes, :active
  end
end
