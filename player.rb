require_relative 'playable'

class Player

  include Playable

  attr_reader :found_treasure
  attr_accessor :name, :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def self.from_csv(line)
    name, health = line.split(',')
    Player.new(name, Integer(health))
  end

  def score
    @health + points
  end

  def <=> other
    other.score <=> score
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def to_csv
    "@name,@health"
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

  def each_found_treasure
    @found_treasure.each do |name, points|
      yield(Treasure.new(name, points))
    end
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
