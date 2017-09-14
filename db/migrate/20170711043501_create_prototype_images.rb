class CreatePrototypeImages < ActiveRecord::Migration[5.1]
  def change
    create_table :prototype_images do |t|
      t.string     :content,   null: false, default: ''
      t.integer    :status,    null: false
      t.references :prototype, null: false,             index: true, foreign_key: true
      t.timestamps             null: false
    end
  end
end
