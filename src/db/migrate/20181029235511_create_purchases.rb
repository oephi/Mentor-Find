class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :charge_id
      t.integer :price

      t.timestamps
    end
  end
end
