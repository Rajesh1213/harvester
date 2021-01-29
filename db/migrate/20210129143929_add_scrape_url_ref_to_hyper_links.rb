class AddScrapeUrlRefToHyperLinks < ActiveRecord::Migration[6.1]
  def change
    add_reference :hyper_links, :scrape_url, null: false, foreign_key: true
  end
end
