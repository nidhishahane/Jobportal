class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :contactno
      t.string :email
      t.text :technology
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
