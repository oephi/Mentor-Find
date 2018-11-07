json.extract! purchase, :id, :service_id, :user_id, :charge_id, :price, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
