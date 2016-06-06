class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name
      t.integer :number_of_vacancy
      t.text :eligibility
      t.string :technology
      t.string :salary
      t.integer :experience
      t.text :key_skills
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
