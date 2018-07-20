require "application_system_test_case"

class DisastersTest < ApplicationSystemTestCase
  setup do
    @disaster = disasters(:one)
  end

  test "visiting the index" do
    visit disasters_url
    assert_selector "h1", text: "Disasters"
  end

  test "creating a Disaster" do
    visit disasters_url
    click_on "New Disaster"

    fill_in "Datetime", with: @disaster.datetime
    fill_in "Indirectly Affected", with: @disaster.indirectly_affected
    fill_in "Integer", with: @disaster.integer
    fill_in "String", with: @disaster.string
    click_on "Create Disaster"

    assert_text "Disaster was successfully created"
    click_on "Back"
  end

  test "updating a Disaster" do
    visit disasters_url
    click_on "Edit", match: :first

    fill_in "Datetime", with: @disaster.datetime
    fill_in "Indirectly Affected", with: @disaster.indirectly_affected
    fill_in "Integer", with: @disaster.integer
    fill_in "String", with: @disaster.string
    click_on "Update Disaster"

    assert_text "Disaster was successfully updated"
    click_on "Back"
  end

  test "destroying a Disaster" do
    visit disasters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Disaster was successfully destroyed"
  end
end
