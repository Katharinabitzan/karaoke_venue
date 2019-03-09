class Room
attr_reader :price, :playlist, :max_capacity, :current_occupancy, :guest_spending_tab, :additional_services

  def initialize(price, playlist, max_capacity, current_occupancy, guest_spending_tab)
    @price = price
    @playlist = playlist
    @max_capacity = max_capacity
    @current_occupancy = current_occupancy
    @guest_spending_tab = guest_spending_tab
    @additional_services = { "drinks" => 3.0, "snacks" => 4, "voice_lessons" => 50 }
  end




  def check_space_in_room
    return @current_occupancy.length < @max_capacity
  end
end
