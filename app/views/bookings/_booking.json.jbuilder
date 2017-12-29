json.extract! booking, :id, :area_id, :point_wallet_id, :check_in, :check_out, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
