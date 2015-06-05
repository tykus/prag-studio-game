require_relative 'player'
require_relative 'clumsy_player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  def initialize(title)
    @title = title
    @players = []
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      add_player Player.from_csv(line)
    end
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    treasures = TreasureTrove::TREASURES
    puts "There are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def total_points
    @players.reduce(0) { |sum, player| sum += player.points }
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      @players.sort.each do |player|
        file.puts high_score_entry(player)
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
      puts high_score_entry player
    end

    # Total Scores
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
  end

  private
    def print_name_and_health(player)
      "#{ player.name } (#{ player.health })"
    end

    def high_score_entry(player)
      formatted_name = player.name.ljust(20, '.')
      "#{formatted_name} #{player.score}"
    end

end
