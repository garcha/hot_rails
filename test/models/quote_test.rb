require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "#total_price returns the sum total" do
    assert_equal 2500, quotes(:first).total_price
  end
end
