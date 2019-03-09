class Guest
attr_reader :name, :age, :cash_in_wallet, :favourite_song_name

  def initialize(name, age, cash_in_wallet, favourite_song_name)
    @name = name
    @age = age
    @cash_in_wallet = cash_in_wallet
    @favourite_song_name = favourite_song_name
  end

  def pay_money_to_karaoke(room)
    @cash_in_wallet -= room.guest_spending_counter
  end
  
end
