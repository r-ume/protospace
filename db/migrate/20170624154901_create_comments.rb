class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text       :text,      null: false
      t.references :user,      null: false, foreign_key: true
      t.references :prototype, null: false, foreign_key: true
      t.timestamps             null: false 
    end

    add_index :comments, [:user_id, :prototype_id]
  end
end
