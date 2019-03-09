require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke")
require_relative("../room")

class KaraokeTest < MiniTest::Test

  def setup

    @rooms = [@room1, @room2, @room3]
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

    @karaoke = Karaoke.new("Singing_in_the_Rain", 0, @rooms, @all_songs)
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
    assert_equal(3, @rooms.length)
  end
  def test_karaoke_has_songs()
    assert_equal(3, @playlist1.length)
  end

  def test_check_guest_age___old_enough()
    assert_equal(true, @karaoke.check_guest_age(@guest1))
  end

  def test_check_guest_age___too_young()
    assert_equal(false, @karaoke.check_guest_age(@guest3))
  end

  def test_check_for_vacant_room_to_accomodate_guest__returns_room()
    @karaoke.check_for_vacant_room_to_accomodate_guest(@rooms)
    assert_equal("room1 is free, please go in there", "#{@room1.check_space_in_room} is free, please go in there")
  end

  # def test_check_for_vacant_room_to_accomodate_guest__returns_all_full()
  #   assert_equal(false, @room2.check_space_in_room)
  # end
  #
  # def test_check_guest_into_room__success()
  #   @karaoke.check_guest_age(@guest1)
  #   @
  # end



end
