class ChangeColumnTypePurchases < ActiveRecord::Migration[5.2]
  def change
    change_column :purchases, :charge_id, :string
  end
end
