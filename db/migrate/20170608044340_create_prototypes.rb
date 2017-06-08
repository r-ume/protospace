class CreatePrototypes < ActiveRecord::Migration[5.1]
	def change
		create_table :prototypes do |t|
			t.string     :name
			t.integer    :user_id
			t.text       :catchcopy
			t.text       :concept
			t.integer    :likes_count, :default => 0
			t.string     :image

			t.timestamps 
		end
	end
end
