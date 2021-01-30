module ScrapeUrlsHelper
  def hyper_links(scrape_url)
    scrape_url.hyper_links.includes(:parameters)
  end
end
