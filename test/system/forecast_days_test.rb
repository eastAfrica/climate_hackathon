require "application_system_test_case"

class ForecastDaysTest < ApplicationSystemTestCase
  setup do
    @forecast_day = forecast_days(:one)
  end

  test "visiting the index" do
    visit forecast_days_url
    assert_selector "h1", text: "Forecast Days"
  end

  test "creating a Forecast day" do
    visit forecast_days_url
    click_on "New Forecast Day"

    fill_in "Day Of Forecast", with: @forecast_day.day_of_forecast
    fill_in "Early Warning Forecast", with: @forecast_day.early_warning_forecast_id
    click_on "Create Forecast day"

    assert_text "Forecast day was successfully created"
    click_on "Back"
  end

  test "updating a Forecast day" do
    visit forecast_days_url
    click_on "Edit", match: :first

    fill_in "Day Of Forecast", with: @forecast_day.day_of_forecast
    fill_in "Early Warning Forecast", with: @forecast_day.early_warning_forecast_id
    click_on "Update Forecast day"

    assert_text "Forecast day was successfully updated"
    click_on "Back"
  end

  test "destroying a Forecast day" do
    visit forecast_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forecast day was successfully destroyed"
  end
end
