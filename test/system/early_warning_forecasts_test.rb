require "application_system_test_case"

class EarlyWarningForecastsTest < ApplicationSystemTestCase
  setup do
    @early_warning_forecast = early_warning_forecasts(:one)
  end

  test "visiting the index" do
    visit early_warning_forecasts_url
    assert_selector "h1", text: "Early Warning Forecasts"
  end

  test "creating a Early warning forecast" do
    visit early_warning_forecasts_url
    click_on "New Early Warning Forecast"

    fill_in "District", with: @early_warning_forecast.district_id
    click_on "Create Early warning forecast"

    assert_text "Early warning forecast was successfully created"
    click_on "Back"
  end

  test "updating a Early warning forecast" do
    visit early_warning_forecasts_url
    click_on "Edit", match: :first

    fill_in "District", with: @early_warning_forecast.district_id
    click_on "Update Early warning forecast"

    assert_text "Early warning forecast was successfully updated"
    click_on "Back"
  end

  test "destroying a Early warning forecast" do
    visit early_warning_forecasts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Early warning forecast was successfully destroyed"
  end
end
