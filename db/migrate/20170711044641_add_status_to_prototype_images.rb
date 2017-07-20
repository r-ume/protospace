class AddStatusToPrototypeImages < ActiveRecord::Migration[5.1]
  def change
    add_column :prototype_images, :status, :integer
  end
end
