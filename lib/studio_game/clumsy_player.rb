require_relative 'player'
require_relative 'treasure_trove'

module StudioGame

  class ClumsyPlayer < Player

    def found_treasure(treasure)
      super(Treasure.new(treasure.name, treasure.points / 2))
    end

  end

end
