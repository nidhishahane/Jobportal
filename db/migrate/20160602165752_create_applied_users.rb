class CreateAppliedUsers < ActiveRecord::Migration
  def change
    create_table :applied_users do |t|
      t.integer :user_id
      t.integer :vacancy_id

      t.timestamps null: false
    end
  end
end
