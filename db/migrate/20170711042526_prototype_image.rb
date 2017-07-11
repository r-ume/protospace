class PrototypeImage < ActiveRecord::Migration[5.1]
  def change
  	create_table :prototype_image do |t|
  		t.string     :content
  		t.references :prototype, index: true, foreign_key: true
		end
  end
end
