class CreateLikes < ActiveRecord::Migration[5.1]
	def change
		create_table :likes do |t|
			t.references :user, index: true
			t.references :prototype, index: true

			t.timestamps
		end
	end
end
