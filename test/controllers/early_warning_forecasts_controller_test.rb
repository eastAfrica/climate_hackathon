require 'test_helper'

class EarlyWarningForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @early_warning_forecast = early_warning_forecasts(:one)
  end

  test "should get index" do
    get early_warning_forecasts_url
    assert_response :success
  end

  test "should get new" do
    get new_early_warning_forecast_url
    assert_response :success
  end

  test "should create early_warning_forecast" do
    assert_difference('EarlyWarningForecast.count') do
      post early_warning_forecasts_url, params: { early_warning_forecast: { district_id: @early_warning_forecast.district_id } }
    end

    assert_redirected_to early_warning_forecast_url(EarlyWarningForecast.last)
  end

  test "should show early_warning_forecast" do
    get early_warning_forecast_url(@early_warning_forecast)
    assert_response :success
  end

  test "should get edit" do
    get edit_early_warning_forecast_url(@early_warning_forecast)
    assert_response :success
  end

  test "should update early_warning_forecast" do
    patch early_warning_forecast_url(@early_warning_forecast), params: { early_warning_forecast: { district_id: @early_warning_forecast.district_id } }
    assert_redirected_to early_warning_forecast_url(@early_warning_forecast)
  end

  test "should destroy early_warning_forecast" do
    assert_difference('EarlyWarningForecast.count', -1) do
      delete early_warning_forecast_url(@early_warning_forecast)
    end

    assert_redirected_to early_warning_forecasts_url
  end
end
