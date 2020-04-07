json.extract! record, :id, :user_id, :merchant_id, :amount, :balance, :created_at, :updated_at
json.url record_url(record, format: :json)
