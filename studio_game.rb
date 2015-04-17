require_relative 'game'

knuckleheads = Game.new("Knuckleheads")

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp

  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
    knuckleheads.print_stats
  when 'quit', 'exit'
    break
  else
    "Please enter a number or 'quit'!"
  end
end
