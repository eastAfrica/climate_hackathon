require "application_system_test_case"

class EarlyWarningReportsTest < ApplicationSystemTestCase
  setup do
    @early_warning_report = early_warning_reports(:one)
  end

  test "visiting the index" do
    visit early_warning_reports_url
    assert_selector "h1", text: "Early Warning Reports"
  end

  test "creating a Early warning report" do
    visit early_warning_reports_url
    click_on "New Early Warning Report"

    fill_in "Early Warning", with: @early_warning_report.early_warning_id
    fill_in "Feedback", with: @early_warning_report.feedback_id
    fill_in "Level", with: @early_warning_report.level
    fill_in "Reciever", with: @early_warning_report.reciever_id
    fill_in "Sector", with: @early_warning_report.sector_id
    click_on "Create Early warning report"

    assert_text "Early warning report was successfully created"
    click_on "Back"
  end

  test "updating a Early warning report" do
    visit early_warning_reports_url
    click_on "Edit", match: :first

    fill_in "Early Warning", with: @early_warning_report.early_warning_id
    fill_in "Feedback", with: @early_warning_report.feedback_id
    fill_in "Level", with: @early_warning_report.level
    fill_in "Reciever", with: @early_warning_report.reciever_id
    fill_in "Sector", with: @early_warning_report.sector_id
    click_on "Update Early warning report"

    assert_text "Early warning report was successfully updated"
    click_on "Back"
  end

  test "destroying a Early warning report" do
    visit early_warning_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Early warning report was successfully destroyed"
  end
end
