require "application_system_test_case"

class NotificationsTest < ApplicationSystemTestCase
  setup do
    @notification = notifications(:one)
  end

  test "visiting the index" do
    visit notifications_url
    assert_selector "h1", text: "Notifications"
  end

  test "creating a Notification" do
    visit notifications_url
    click_on "New Notification"

    fill_in "Action", with: @notification.action
    fill_in "Notifiable", with: @notification.notifiable
    fill_in "Read at", with: @notification.read_at
    fill_in "Receiver", with: @notification.receiver_id
    fill_in "Sender", with: @notification.sender_id
    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "updating a Notification" do
    visit notifications_url
    click_on "Edit", match: :first

    fill_in "Action", with: @notification.action
    fill_in "Notifiable", with: @notification.notifiable
    fill_in "Read at", with: @notification.read_at
    fill_in "Receiver", with: @notification.receiver_id
    fill_in "Sender", with: @notification.sender_id
    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification" do
    visit notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification was successfully destroyed"
  end
end
