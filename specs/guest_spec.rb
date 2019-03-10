require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../room")
require_relative("../karaoke")

class GuestTest < MiniTest::Test

  def setup()
    @guest1 = Guest.new("Bill", 26, 100, "Mr. Trex")
    @guest2 = Guest.new("Monika", 52, 500, "Hey Jude")
  end

  def test_can_create_guest_from_class()
    assert_equal(Guest, @guest1.class)
  end
  def test_guest_has_name()
    assert_equal("Bill", @guest1.name)
  end
  def test_guest_has_age()
    assert_equal(26, @guest1.age)
  end
  def test_guest_has_cash_in_wallet()
    assert_equal(100, @guest1.cash_in_wallet)
  end
  def test_guest_has_favourite_song_name()
    assert_equal("Mr. Trex", @guest1.favourite_song_name)
  end

  def test_pay_money_to_room()
    @room3 = Room.new(30, [], 5, 0, 30)
    @guest1.pay_money_to_room(@room3)
    assert_equal(70, @guest1.cash_in_wallet)
  end

end
