class Player

  attr_reader :health, :found_treasure
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted"
  end

  def score
    @health + points
  end

  def strong?
    @health > 100
  end
  
  def <=> other
    other.score <=> score
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def points
    points_total = 0
    @found_treasure.values.reduce(0, :+)
  end

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasure}."
  end

end

if __FILE__ == $0
  player = Player.new("moe")

  puts player

  player.w00t
  puts player

  player.blam
  puts player

end
