class Karaoke
attr_reader :name, :till, :rooms, :songs

  def initialize(name, till, rooms = [], songs)
    @name = name
    @till = 0
    @rooms = rooms
    @songs = songs
  end

  def check_guest_age(guest)
    return guest.age > 18
  end

  def list_current_rooms(rooms)
    return @rooms
  end

  def check_for_vacant_room_to_accomodate_guest
    all_rooms = @rooms.list_current_rooms
    least_occupied_room = all_rooms.max_by { |room| room.max_capacity - room.current_occupancy.length}
    return least_occupied_room
  end

  # def check_guest_into_room_and_collect_entry_fee(guest, room)
  # end
  #
  # def check_guest_out_collect_cash_from_guest(guest, room)

  # end
end
