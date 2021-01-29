require "test_helper"

class ScrapeUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scrape_url = scrape_urls(:one)
  end

  test "should get index" do
    get scrape_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_scrape_url_url
    assert_response :success
  end

  test "should create scrape_url" do
    assert_difference('ScrapeUrl.count') do
      post scrape_urls_url, params: { scrape_url: { url: @scrape_url.url } }
    end

    assert_redirected_to scrape_url_url(ScrapeUrl.last)
  end

  test "should show scrape_url" do
    get scrape_url_url(@scrape_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_scrape_url_url(@scrape_url)
    assert_response :success
  end

  test "should update scrape_url" do
    patch scrape_url_url(@scrape_url), params: { scrape_url: { url: @scrape_url.url } }
    assert_redirected_to scrape_url_url(@scrape_url)
  end

  test "should destroy scrape_url" do
    assert_difference('ScrapeUrl.count', -1) do
      delete scrape_url_url(@scrape_url)
    end

    assert_redirected_to scrape_urls_url
  end
end
