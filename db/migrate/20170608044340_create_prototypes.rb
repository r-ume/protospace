class CreatePrototypes < ActiveRecord::Migration[5.1]
  def change
    create_table :prototypes, option: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;' do |t|
      t.string     :name,        null: false, default: '' 
			t.references :user,                                 index: true
      t.text       :catchcopy,   null: false
      t.text       :concept,     null: false
      t.integer    :likes_count, null: false, default: 0
      t.timestamps               null: false 
    end
  end
end
