require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player player
    @players << player
  end

  def play(rounds)
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

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
      puts print_name_and_health(player)
    end
    puts "#{ wimpy_players.count } wimpy players:"
    wimpy_players.each do |player|
      puts print_name_and_health(player)
    end

    # High Scores
    puts "\n#{ @title } High Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end

    # Total Scores
    @players.each do |player|
      puts "#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end
  end

  private
    def print_name_and_health(player)
      "#{ player.name } (#{ player.health })"
    end

end
