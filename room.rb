class Room
attr_reader :price, :playlist, :max_capacity, :current_occupancy, :guest_spending_tab, :additional_services

  def initialize(price, playlist, max_capacity, current_occupancy, guest_spending_tab)
    @price = price
    @playlist = playlist
    @max_capacity = max_capacity
    @current_occupancy = current_occupancy
    @guest_spending_tab = guest_spending_tab
    @additional_services = { "drinks" => 3, "snacks" => 4, "voice_lessons" => 50 }
  end

  # def room_has_how_many_songs_in_playlist(playlist)
  #   array_of_song_names = playlist.map { |song| playlist.}
  # end

  def space_currently_available_in_this_room
    number_of_occupants = @current_occupancy.length
    return @max_capacity - number_of_occupants
  end

  def receive_guest(guest)
    @current_occupancy << guest
  end
end
