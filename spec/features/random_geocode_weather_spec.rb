require "rails_helper"

RSpec.describe "Weather feature spec", type: :feature do
  before do
    stub_request(:get, /lon=/).and_return(
      status: 200,
      body:
        '{
          "coord": {
            "lon": 24.95,
            "lat": 60.18
          },
          "weather": [
            {
              "id": 802,
              "description": "scattered clouds"
            }
          ],
          "main": {
            "temp": 14,
            "pressure": 1004,
            "humidity": 82
          },
          "sys": {
            "country": "FI"
          }
        }')

    stub_request(:get, /q=/).and_return( status: 404 )
  end

  it "gets a random location and returns an error if the locatino does not exists" do
    visit("/")

    expect(page).to have_css(".wi")
    expect(page).to have_css(".table")
    expect(page).to have_content("Scattered clouds")

		page.fill_in("city", with: "something")
		click_button("Search")

		expect(page).to have_css(".alert")
    expect(page).not_to have_css(".wi")
  end
end
