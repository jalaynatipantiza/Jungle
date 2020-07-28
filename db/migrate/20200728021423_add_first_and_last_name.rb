class AddFirstAndLastName < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
  end
end
