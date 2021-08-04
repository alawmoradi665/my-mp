json.extract! listing, :id, :title, :price, :description, :measurements, :state, :city, :suburb, :created_at, :updated_at
json.url listing_url(listing, format: :json)
