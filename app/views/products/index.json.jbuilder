json.array!(@products) do |product|
  json.extract! product, :id, :title, :release_year, :price, :description
  json.url product_url(product, format: :json)
end
