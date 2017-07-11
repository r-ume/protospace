class RemoveImageFromPrototypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :prototypes, :image, :string
  end
end
