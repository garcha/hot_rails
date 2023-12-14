require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date return the previous date when it exists" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date returns nil when there is no previous date" do
    assert_nil line_item_dates(:today).previous_date
  end
end
