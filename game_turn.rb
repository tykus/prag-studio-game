require_relative 'die'
require_relative 'treasure_trove'

module GameTurn

  def self.take_turn(player)
  	treasure = TreasureTrove.random
  	player.found_treasure(treasure)
    die = Die.new
    case die.roll
    when 5..6
      player.w00t
    when 1..2
      player.blam
    end
  end

end
