class HyperLink < ApplicationRecord
    belongs_to :scrape_url
    has_many :parameters
end
