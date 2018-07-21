require 'test_helper'

class ForecastDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast_day = forecast_days(:one)
  end

  test "should get index" do
    get forecast_days_url
    assert_response :success
  end

  test "should get new" do
    get new_forecast_day_url
    assert_response :success
  end

  test "should create forecast_day" do
    assert_difference('ForecastDay.count') do
      post forecast_days_url, params: { forecast_day: { day_of_forecast: @forecast_day.day_of_forecast, early_warning_forecast_id: @forecast_day.early_warning_forecast_id } }
    end

    assert_redirected_to forecast_day_url(ForecastDay.last)
  end

  test "should show forecast_day" do
    get forecast_day_url(@forecast_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_forecast_day_url(@forecast_day)
    assert_response :success
  end

  test "should update forecast_day" do
    patch forecast_day_url(@forecast_day), params: { forecast_day: { day_of_forecast: @forecast_day.day_of_forecast, early_warning_forecast_id: @forecast_day.early_warning_forecast_id } }
    assert_redirected_to forecast_day_url(@forecast_day)
  end

  test "should destroy forecast_day" do
    assert_difference('ForecastDay.count', -1) do
      delete forecast_day_url(@forecast_day)
    end

    assert_redirected_to forecast_days_url
  end
end
