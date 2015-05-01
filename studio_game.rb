require_relative 'game'

knuckleheads = Game.new("Knuckleheads")

knuckleheads.load_players(ARGV.shift || "players.csv")

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
