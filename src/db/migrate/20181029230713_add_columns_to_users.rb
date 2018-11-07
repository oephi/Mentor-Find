class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :phone, :integer
    add_column :users, :description, :text
    add_column :users, :avatar, :text
  end
end