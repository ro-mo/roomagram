require "application_system_test_case"

class MediaItemsTest < ApplicationSystemTestCase
  setup do
    @media_item = media_items(:one)
  end

  test "visiting the index" do
    visit media_items_url
    assert_selector "h1", text: "Media items"
  end

  test "should create media item" do
    visit media_items_url
    click_on "New media item"

    fill_in "Room", with: @media_item.room_id
    fill_in "X", with: @media_item.x
    fill_in "Y", with: @media_item.y
    fill_in "Z", with: @media_item.z
    click_on "Create Media item"

    assert_text "Media item was successfully created"
    click_on "Back"
  end

  test "should update Media item" do
    visit media_item_url(@media_item)
    click_on "Edit this media item", match: :first

    fill_in "Room", with: @media_item.room_id
    fill_in "X", with: @media_item.x
    fill_in "Y", with: @media_item.y
    fill_in "Z", with: @media_item.z
    click_on "Update Media item"

    assert_text "Media item was successfully updated"
    click_on "Back"
  end

  test "should destroy Media item" do
    visit media_item_url(@media_item)
    click_on "Destroy this media item", match: :first

    assert_text "Media item was successfully destroyed"
  end
end
