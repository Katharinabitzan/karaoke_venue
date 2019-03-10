# require('pry')    binding.pry

class Karaoke
attr_reader :name, :till, :rooms, :songs, :available_rooms

  def initialize(name, till, rooms = [], songs = [])
    @name = name
    @till = 0
    @rooms = rooms
    @available_rooms = []
    @songs = songs
  end

  def check_guest_age(guest)
    if guest.age < 18
      return "Sorry too young."
    else
      return "#{guest.name} is old enough."
    end
  end

  def add_rooms_to_available_rooms()
    for room in @rooms
      if room.space_currently_available_in_this_room > 0
        @available_rooms << room
      end
    end
    return @available_rooms
  end

  def check_in_guest_to_first_available_room(guest)
    first_available_room = add_rooms_to_available_rooms()[0]
    first_available_room.receive_guest(guest)
  end
end
