require_relative 'player'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player player
    @players << player
  end

  def play
    puts @players

    @players.each do |player|
      player.w00t
      player.blam
      player.blam
      puts player
    end
  end

end