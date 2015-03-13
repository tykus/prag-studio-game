require_relative 'player'
require_relative 'die'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player player
    @players << player
  end

  def play
    die = Die.new

    @players.each do |player|
      case die.roll
      when 5..6
        player.w00t
      when 1..2
        player.blam
      end
      puts player
    end
  end

end
