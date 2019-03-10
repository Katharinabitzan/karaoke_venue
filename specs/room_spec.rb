require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @rooms = [@room1, @room2, @room3]
    @room1 = Room.new(20, [], 3, 0, 0)
    @room2 = Room.new(30, [], 2, 2, 0)
    @room3 = Room.new(30, [], 5, 0, 0)

    @song1 = Song.new("Hey Jude", "The Beatles")
    @song2 = Song.new("Believe", "Cher")
    @song3 = Song.new("OMG", "Usher")
    @song4 = Song.new("Slim Shady", "Eminem")
    @song5 = Song.new("Enter Sandman", "Metallica")
    @song6 = Song.new("Hit Me Baby One More Time", "Brittney Spears")


  end

  def test_can_create_room_from_class()
    assert_equal(Room, @room1.class)
  end
  def test_room_has_price()
    assert_equal(20, @room1.price)
  end
  def test_room_can_have_playlist()
    assert_equal([], @room1.playlist)
  end
  def test_room_has_max_capacity()
    assert_equal(3, @room1.max_capacity)
  end
  def test_room_has_current_occupancy()
    assert_equal(2, @room2.current_occupancy)
  end
  def test_room_has_room_spending_tab()
    assert_equal(0, @room1.room_spending_tab)
  end
  def test_room_has_additional_services()
    assert_equal(3, @room1.additional_services["drinks"])
  end

  def test_space_currently_available_in_this_room__available()
    space_available = @room1.space_currently_available_in_this_room
    assert_equal(3, space_available)
  end

  def test_space_currently_available_in_this_room__full()
    space_available = @room2.space_currently_available_in_this_room
    assert_equal(0, space_available)
  end

  def test_guest_is_checked_in()
    @room1.guest_is_checked_in(@guest1)
    assert_equal(2, @room1.space_currently_available_in_this_room)
    assert_equal(20, @room1.room_spending_tab)
  end

  def test_decrease_occupancy_reset_spending_counter()
    @room1.guest_is_checked_in(@guest1)
    @room1.decrease_occupancy_reset_spending_counter
    assert_equal(3, @room1.space_currently_available_in_this_room)
    assert_equal(0, @room1.room_spending_tab)
  end

  # def test_sell_service_add_to_spending_counter()
  #
  #   assert_equal()
  end
end
