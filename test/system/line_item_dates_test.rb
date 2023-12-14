require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)

    @quote = Quote.first
    @line_item_date = line_item_dates(:today)

    visit quote_path(@quote)
  end

  test "Creating a new line item date" do
    assert_selector "h1", text: "First quote"

    click_on "New Date"
    assert_selector "h1", text: "First quote"

    date = Date.current + 1.day
    fill_in "Date", with: date

    click_on "Create Line item date"
    assert_text I18n.l(date, format: :long)
  end

  test "Updating a line item date" do
    assert_selector "h1", text: "First quote"

    within id: dom_id(@line_item_date) do
      click_on "Edit"
    end

    assert_selector "h1", text: "First quote"
    date = Date.current + 14.day

    fill_in "Date", with: date
    click_on "Update Line item date"

    assert_text I18n.l(date, format: :long)
  end

  test "Destroying a line item date" do
    assert_text I18n.l(Date.current, format: :long)

    accept_confirm do
      within id: dom_id(@line_item_date) do
        click_on "Delete"
      end
    end

    assert_no_text I18n.l(Date.current, format: :long)
  end
end
