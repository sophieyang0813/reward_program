json.extract! partner, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url partner_url(partner, format: :json)
