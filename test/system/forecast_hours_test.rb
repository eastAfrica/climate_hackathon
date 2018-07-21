require "application_system_test_case"

class ForecastHoursTest < ApplicationSystemTestCase
  setup do
    @forecast_hour = forecast_hours(:one)
  end

  test "visiting the index" do
    visit forecast_hours_url
    assert_selector "h1", text: "Forecast Hours"
  end

  test "creating a Forecast hour" do
    visit forecast_hours_url
    click_on "New Forecast Hour"

    fill_in "Disruption Level", with: @forecast_hour.disruption_level
    fill_in "Forecast Day", with: @forecast_hour.forecast_day_id
    fill_in "Probability Of Occurence", with: @forecast_hour.probability_of_occurence
    click_on "Create Forecast hour"

    assert_text "Forecast hour was successfully created"
    click_on "Back"
  end

  test "updating a Forecast hour" do
    visit forecast_hours_url
    click_on "Edit", match: :first

    fill_in "Disruption Level", with: @forecast_hour.disruption_level
    fill_in "Forecast Day", with: @forecast_hour.forecast_day_id
    fill_in "Probability Of Occurence", with: @forecast_hour.probability_of_occurence
    click_on "Update Forecast hour"

    assert_text "Forecast hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Forecast hour" do
    visit forecast_hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forecast hour was successfully destroyed"
  end
end
