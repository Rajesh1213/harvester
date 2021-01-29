require "application_system_test_case"

class ScrapeUrlsTest < ApplicationSystemTestCase
  setup do
    @scrape_url = scrape_urls(:one)
  end

  test "visiting the index" do
    visit scrape_urls_url
    assert_selector "h1", text: "Scrape Urls"
  end

  test "creating a Scrape url" do
    visit scrape_urls_url
    click_on "New Scrape Url"

    fill_in "Url", with: @scrape_url.url
    click_on "Create Scrape url"

    assert_text "Scrape url was successfully created"
    click_on "Back"
  end

  test "updating a Scrape url" do
    visit scrape_urls_url
    click_on "Edit", match: :first

    fill_in "Url", with: @scrape_url.url
    click_on "Update Scrape url"

    assert_text "Scrape url was successfully updated"
    click_on "Back"
  end

  test "destroying a Scrape url" do
    visit scrape_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scrape url was successfully destroyed"
  end
end
