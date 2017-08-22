class RemoveColumnToPrototype < ActiveRecord::Migration[5.1]
  def change
    remove_column :prototypes, :user_id, :integer
  end
end
