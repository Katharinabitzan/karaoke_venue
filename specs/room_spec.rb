require("minitest/autorun")
require('minitest/rg')
require_relative("../guest")
require_relative("../song")
require_relative("../karaoke")
require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new( )
    @room2 = Room.new()
  end

end
