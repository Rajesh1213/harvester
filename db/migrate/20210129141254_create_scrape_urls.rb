class CreateScrapeUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :scrape_urls do |t|
      t.string :url

      t.timestamps
    end
  end
end
