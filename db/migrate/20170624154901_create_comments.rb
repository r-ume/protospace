class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text       :text,      null: false
      t.references :user,                   foreign_key: true
      t.references :prototype,              foreign_key: true
      t.timestamps             null: false 
    end

    add_index :comments, [:user_id, :prototype_id]
  end
end
