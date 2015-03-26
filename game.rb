require_relative 'player'
require_relative 'game_turn'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player player
    @players << player
  end

  def play
    @players.each do |player|
      GameTurn.take_turn(player)
      puts player
    end
  end

end
