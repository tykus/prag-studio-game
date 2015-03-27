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

  def play(rounds)
    1.upto(rounds) do |round|  
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
  
  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong? }
    
    puts "\n#{ @title } Statistics:"
    puts "#{ strong_players.count } strong players:"
    strong_players.each do |player|
      puts "#{ player.name } (#{ player.health })"
    end
    puts "#{ wimpy_players.count } wimpy players:"
    wimpy_players.each do |player|
      puts "#{ player.name } (#{ player.health })"
    end
  end

end
