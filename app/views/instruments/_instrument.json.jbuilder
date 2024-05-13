json.extract! instrument, :id, :manafacturer, :model_type, :serial_no, :condition, :year, :price, :details, :created_at, :updated_at
json.url instrument_url(instrument, format: :json)
