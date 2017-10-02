json.extract! customer, :id, :object_id, :object_type, :object_changes, :created_at, :updated_at
json.url customer_url(customer, format: :json)
