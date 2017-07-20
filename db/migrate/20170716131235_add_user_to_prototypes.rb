class AddUserToPrototypes < ActiveRecord::Migration[5.1]
  def change
    add_reference :prototypes, :user, index: true, foreign_key: true
  end
end
