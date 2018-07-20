require 'test_helper'

class ForecastHoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast_hour = forecast_hours(:one)
  end

  test "should get index" do
    get forecast_hours_url
    assert_response :success
  end

  test "should get new" do
    get new_forecast_hour_url
    assert_response :success
  end

  test "should create forecast_hour" do
    assert_difference('ForecastHour.count') do
      post forecast_hours_url, params: { forecast_hour: { disruption_level: @forecast_hour.disruption_level, forecast_day_id: @forecast_hour.forecast_day_id, probability_of_occurence: @forecast_hour.probability_of_occurence } }
    end

    assert_redirected_to forecast_hour_url(ForecastHour.last)
  end

  test "should show forecast_hour" do
    get forecast_hour_url(@forecast_hour)
    assert_response :success
  end

  test "should get edit" do
    get edit_forecast_hour_url(@forecast_hour)
    assert_response :success
  end

  test "should update forecast_hour" do
    patch forecast_hour_url(@forecast_hour), params: { forecast_hour: { disruption_level: @forecast_hour.disruption_level, forecast_day_id: @forecast_hour.forecast_day_id, probability_of_occurence: @forecast_hour.probability_of_occurence } }
    assert_redirected_to forecast_hour_url(@forecast_hour)
  end

  test "should destroy forecast_hour" do
    assert_difference('ForecastHour.count', -1) do
      delete forecast_hour_url(@forecast_hour)
    end

    assert_redirected_to forecast_hours_url
  end
end
