require("minitest/autorun")
require('minitest/rg')
require_relative("../song")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Hey Jude", "The Beatles")
    @song2 = Song.new("Believe", "Cher")
    @song3 = Song.new("OMG", "Usher")
  end

  def test_can_create_song_from_class()
    assert_equal(Song, @song1.class)
  end

  def test_song_has_name()
    assert_equal("Hey Jude", @song1.name)
  end

  def test_song_has_artist()
    assert_equal("Cher", @song2.artist)
  end
end
