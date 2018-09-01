require "application_system_test_case"

class WatchersTest < ApplicationSystemTestCase
  setup do
    @watcher = watchers(:one)
  end

  test "visiting the index" do
    visit watchers_url
    assert_selector "h1", text: "Watchers"
  end

  test "creating a Watcher" do
    visit watchers_url
    click_on "New Watcher"

    fill_in "Current Status", with: @watcher.current_status
    fill_in "Name", with: @watcher.name
    fill_in "Previous Status", with: @watcher.previous_status
    fill_in "Url", with: @watcher.url
    click_on "Create Watcher"

    assert_text "Watcher was successfully created"
    click_on "Back"
  end

  test "updating a Watcher" do
    visit watchers_url
    click_on "Edit", match: :first

    fill_in "Current Status", with: @watcher.current_status
    fill_in "Name", with: @watcher.name
    fill_in "Previous Status", with: @watcher.previous_status
    fill_in "Url", with: @watcher.url
    click_on "Update Watcher"

    assert_text "Watcher was successfully updated"
    click_on "Back"
  end

  test "destroying a Watcher" do
    visit watchers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Watcher was successfully destroyed"
  end
end
