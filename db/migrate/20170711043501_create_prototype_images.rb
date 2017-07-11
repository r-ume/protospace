class CreatePrototypeImages < ActiveRecord::Migration[5.1]
  def change
    create_table :prototype_images do |t|
			t.string     :content
			t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end
