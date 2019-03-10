require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke")
require_relative("../room")

class KaraokeTest < MiniTest::Test

  def setup

    @room1 = Room.new(20, [], 3, 0, 0)
    @room2 = Room.new(30, [], 2, 2, 0)
    @room3 = Room.new(30, [], 5, 0, 0)

    @guest1 = Guest.new("Bill", 100, "Mr. Trex")
    @guest2 = Guest.new("Monika", 500, "Hey Jude")
    @guest3 = Guest.new("Sam", 200, "OMG")
    @guest4 = Guest.new("Bella", 5, "Fly high")

    @song1 = Song.new("Hey Jude", "The Beatles")
    @song2 = Song.new("Believe", "Cher")
    @song3 = Song.new("OMG", "Usher")
    @song4 = Song.new("Slim Shady", "Eminem")
    @song5 = Song.new("Enter Sandman", "Metallica")
    @song6 = Song.new("Hit Me Baby One More Time", "Brittney Spears")

    @karaoke = Karaoke.new("Singing_in_the_Rain", 0, [@room1, @room2, @room3], [@song1, @song2, @song3, @song4, @song5, @song6])
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
    assert_equal(6, @karaoke.songs.length)
  end
  def test_karaoke_can_make_playlist()
    @karaoke.make_playlist(@room3, @karaoke.songs)
    assert_equal(6, @room3.playlist.length)
  end

  def test_find_available_room__found()
    found_room = @karaoke.find_available_room()
    assert_equal(@room1, found_room)
  end

  def test_no_available_room__not_found()
    karaoke2 = Karaoke.new("Singing_in_the_Rain", 0, [@room2], [@song1])
    found_room = karaoke2.find_available_room()
    assert_nil(nil, found_room)
  end

  def test_no_available_room__found_next_room()
    room1 = Room.new(20, [], 1, 0, 0)
    karaoke2 = Karaoke.new("Singing_in_the_Rain", 0, [room1, @room2, @room3], [@song1])
    chosen_room = karaoke2.find_available_room()
    karaoke2.check_guest_into_room(@guest1, chosen_room)
    next_available_room = karaoke2.find_available_room()
    assert_equal(@room3, next_available_room)
  end

  def test_check_guest_into_room()
    chosen_room = @karaoke.find_available_room()
    @karaoke.check_guest_into_room(@guest1, chosen_room)
    @karaoke.check_guest_into_room(@guest2, chosen_room)
    assert_equal(1, chosen_room.space_currently_available_in_this_room)
    assert_equal(40, chosen_room.room_spending_tab)
  end

  def test_check_all_guests_out_of_room()
    chosen_room = @karaoke.find_available_room()
    @karaoke.check_guest_into_room(@guest1, chosen_room)
    assert_equal(2, chosen_room.space_currently_available_in_this_room)
    assert_equal(20, chosen_room.room_spending_tab)
    @karaoke.check_all_guests_out_of_room(@guest1, chosen_room)
    assert_equal(3, chosen_room.space_currently_available_in_this_room)
    assert_equal(0, chosen_room.room_spending_tab)
  end

  def test_guest_when_song_is_on_playlist__cheers
    new_playlist = @karaoke.make_playlist(@room3, @karaoke.songs)
    to_cheer = @guest2.is_favourite_song_on_playlist(new_playlist)
    assert_equal("Cheer!", to_cheer)
  end

  def test_guest_when_song_is_on_playlist__doesnt_cheer
    new_playlist = @karaoke.make_playlist(@room3, @karaoke.songs)
    to_cheer = @guest1.is_favourite_song_on_playlist(new_playlist)
    assert_nil(nil, to_cheer)
  end

  def test_complete_transaction()
    all_songs = [@song1, @song2, @song3, @song4, @song5, @song6]
    available_room = @karaoke.find_available_room()
    @karaoke.complete_transaction(@guest2, all_songs, available_room)
    assert_equal(3, available_room.space_currently_available_in_this_room)
    assert_equal(0, available_room.room_spending_tab)
    # assert_equal(0, @karaoke.till)
    # assert_equal(80, @guest1.cash_in_wallet)
  end
end
