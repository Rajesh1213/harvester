json.extract! scrape_url, :id, :url, :created_at, :updated_at
json.url scrape_url_url(scrape_url, format: :json)
