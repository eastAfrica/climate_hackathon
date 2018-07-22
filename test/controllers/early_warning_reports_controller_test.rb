require 'test_helper'

class EarlyWarningReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @early_warning_report = early_warning_reports(:one)
  end

  test "should get index" do
    get early_warning_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_early_warning_report_url
    assert_response :success
  end

  test "should create early_warning_report" do
    assert_difference('EarlyWarningReport.count') do
      post early_warning_reports_url, params: { early_warning_report: { early_warning_id: @early_warning_report.early_warning_id, feedback_id: @early_warning_report.feedback_id, level: @early_warning_report.level, reciever_id: @early_warning_report.reciever_id, sector_id: @early_warning_report.sector_id } }
    end

    assert_redirected_to early_warning_report_url(EarlyWarningReport.last)
  end

  test "should show early_warning_report" do
    get early_warning_report_url(@early_warning_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_early_warning_report_url(@early_warning_report)
    assert_response :success
  end

  test "should update early_warning_report" do
    patch early_warning_report_url(@early_warning_report), params: { early_warning_report: { early_warning_id: @early_warning_report.early_warning_id, feedback_id: @early_warning_report.feedback_id, level: @early_warning_report.level, reciever_id: @early_warning_report.reciever_id, sector_id: @early_warning_report.sector_id } }
    assert_redirected_to early_warning_report_url(@early_warning_report)
  end

  test "should destroy early_warning_report" do
    assert_difference('EarlyWarningReport.count', -1) do
      delete early_warning_report_url(@early_warning_report)
    end

    assert_redirected_to early_warning_reports_url
  end
end
