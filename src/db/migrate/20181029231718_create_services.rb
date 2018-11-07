class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :experience
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
