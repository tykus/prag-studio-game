require_relative '../lib/studio_game/game'
require_relative '../lib/studio_game/berserk_player'

knuckleheads = StudioGame::Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = StudioGame::ClumsyPlayer.new "Watt", 100
knuckleheads.add_player klutz

berserker = StudioGame::BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp

  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    "Please enter a number or 'quit'!"
  end
end

knuckleheads.save_high_scores
