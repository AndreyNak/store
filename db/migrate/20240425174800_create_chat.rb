class CreateChat < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.text :status
      t.text :title, null: false
      t.timestamps
    end
  end
end
