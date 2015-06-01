require_relative 'player'
require_relative 'treasure_trove'

class ClumsyPlayer < Player

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points / 2
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end

end
