class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user,      null: false, index: true
      t.references :prototype, null: false, index: true
      t.timestamps             null: false
    end

    add_index :likes, [:user_id, :prototype_id]
    add_index :likes, [:user_id, :prototype_id], unique: true, name: 'uk_likes_on_user_and_prototype'
  end
end
