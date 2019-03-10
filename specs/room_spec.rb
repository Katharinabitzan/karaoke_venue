require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @rooms = [@room1, @room2, @room3]
    @room1 = Room.new(20, @playlist1, 3, [], 0)
    @room2 = Room.new(30, @playlist2, 2, ["cleaner", "squatter"], 0)
    @room3 = Room.new(30, @playlist2, 5, [], 0)

    @song1 = Song.new("Hey Jude", "The Beatles")
    @song2 = Song.new("Believe", "Cher")
    @song3 = Song.new("OMG", "Usher")
    @playlist1 = [@song1, @song2, @song3]

    @song4 = Song.new("Slim Shady", "Eminem")
    @song5 = Song.new("Enter Sandman", "Metallica")
    @song6 = Song.new("Hit Me Baby One More Time", "Brittney Spears")
    @playlist2 = [@song4, @song5, @song6]

    @all_songs = [@playlist1, @playlist2]

  end

  def test_can_create_room_from_class()
    assert_equal(Room, @room1.class)
  end
  def test_room_has_price()
    assert_equal(20, @room1.price)
  end
  # def test_room_has_how_many_songs_in_playlist()
  #   assert_equal(3, @room1.room_has_how_many_songs_in_playlist)
  # end
  def test_room_has_max_capacity()
    assert_equal(3, @room1.max_capacity)
  end
  def test_room_has_current_occupancy()
    assert_equal(2, @room2.current_occupancy.length)
  end
  def test_room_has_guest_spending_tab()
    assert_equal(0, @room1.guest_spending_tab)
  end
  def test_room_has_additional_services()
    assert_equal(3, @room1.additional_services["drinks"])
  end

  def test_space_currently_available_in_this_room()
    space_available = @room2.space_currently_available_in_this_room
    assert_equal(0, space_available)
  end

  def test_receive_guest()
    @room1.receive_guest(@guest1)
    assert_equal(1, @room1.current_occupancy.length)
  end



end
