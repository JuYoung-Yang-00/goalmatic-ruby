require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "activity must be positive" do
    activity = Activity.new(amount: 0)
    assert activity.invalid?
  end
end
