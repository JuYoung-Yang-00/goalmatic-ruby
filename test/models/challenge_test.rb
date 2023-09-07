require "test_helper"

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "challenge name must be present" do
    challenge = Challenge.new()
    assert challenge.invalid?
  end

  test "after an activity is created, increase the challenge progress" do
    challenge = challenges(:sleep_40)
    activity = Activity.create(amount: 6, challenge: challenge)
    assert challenge.reload.progress == 14
  end

end
