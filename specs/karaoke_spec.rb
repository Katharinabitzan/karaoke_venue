require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke")
require_relative("../room")

class KaraokeTest < MiniTest::Test

  def setup

    @room1 = Room.new(20, @playlist1, 3, [], 0)
    @room2 = Room.new(30, @playlist2, 2, ["cleaner", "squatter"], 0)
    @room3 = Room.new(30, @playlist2, 5, [], 0)

    @guest1 = Guest.new("Bill", 26, 100, "Mr. Trex")
    @guest2 = Guest.new("Monika", 52, 500, "Hey Jude")
    @guest3 = Guest.new("Sam", 12, 200, "OMG")
    @guest4 = Guest.new("Bella", 20, 5, "Fly high")


    @all_songs = [@playlist1, @playlist2]

    @playlist1 = [@song1, @song2, @song3]
    @song1 = Song.new("Hey Jude", "The Beatles")
    @song2 = Song.new("Believe", "Cher")
    @song3 = Song.new("OMG", "Usher")

    @playlist2 = [@song4, @song5, @song6]
    @song4 = Song.new("Slim Shady", "Eminem")
    @song5 = Song.new("Enter Sandman", "Metallica")
    @song6 = Song.new("Hit Me Baby One More Time", "Brittney Spears")

    @karaoke = Karaoke.new("Singing_in_the_Rain", 0, [@room1, @room2, @room3], @all_songs)
  end

  def test_can_create_karaoke_from_class()
    assert_equal(Karaoke, @karaoke.class)
  end
  def test_karaoke_has_name()
    assert_equal("Singing_in_the_Rain", @karaoke.name)
  end
  def test_karaoke_has_till()
    assert_equal(0, @karaoke.till)
  end

  def test_karaoke_has_rooms()
    assert_equal(3, @karaoke.rooms.length)
  end
  def test_karaoke_has_songs()
    assert_equal(3, @playlist1.length)
  end

  def test_check_guest_age___old_enough()
    assert_equal("Bill is old enough.", @karaoke.check_guest_age(@guest1))
  end

  def test_karaoke_has_available_rooms__empty()
    assert_equal([], @karaoke.available_rooms)
  end

  def test_karaoke_has_available_rooms__added()
    available_rooms = @karaoke.add_rooms_to_available_rooms
    assert_equal(2, available_rooms.length)
  end

  def test_allocate_first_available_room()
    available_rooms = @karaoke.add_rooms_to_available_rooms
    first_available_room = available_rooms[0]
    assert_equal(@room1, first_available_room)
    second_available_room = available_rooms[1]
    assert_equal(@room3, second_available_room)
  end

  def test_check_in_guest_to_first_available_room()
    @karaoke.check_in_guest_to_first_available_room(@guest1)
    assert_equal(2, @room1.space_currently_available_in_this_room)
  end

  def test_check_in_guest_to_first_available_room()
    @karaoke.check_in_guest_to_first_available_room(@guest1)
    @karaoke.check_in_guest_to_first_available_room(@guest2)
    @karaoke.check_in_guest_to_first_available_room(@guest3)
    @karaoke.check_in_guest_to_first_available_room(@guest4)

    assert_equal(0, @room1.space_currently_available_in_this_room)
    assert_equal(4, @room3.space_currently_available_in_this_room)
  end


end




####-----Why doesnt this work?-------###

# def test_karaoke_has_rooms()
#   assert_equal([@room1, @room2, @room3], @karaoke.rooms)
# end
