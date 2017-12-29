json.extract! promotion, :id, :area_id, :name, :reward_type, :point, :description, :terms_conditions, :valid_from, :valid_to, :avatar, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)
