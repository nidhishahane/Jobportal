class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :contactno, :string
    add_column :users, :current_location, :string
    add_column :users, :key_skills, :text
  end
end
