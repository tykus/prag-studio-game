require_relative 'player'

describe Player do
  before do
    # Suppress standard output in the program
    $stdout = StringIO.new
    @initial_health = 150
    @player = Player.new('larry', @initial_health)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do
    expect(@player.health).to eq(150)
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm Larry with health = 150, points = 0, and score = 150.")
  end

  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.score).to eq(150 + (50*2))
  end

  it "increases the health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(165)
  end

  it "decreases the health by 10 when blammed" do
    @player.blam
    expect(@player.health).to eq(140)
  end

  context "with health greater than 100" do
    before do
      @initial_health = 150
      @player = Player.new("larry", @initial_health)
    end

    it "is strong" do
      expect(@player).to be_strong
    end
  end

  context "with health of 100 or less" do
    before do
      @initial_health = 100
      @player = Player.new("larry", @initial_health)
    end

    it "is wimpy" do
      expect(@player).not_to be_strong
    end
  end
  
  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)
      @players = [@player1, @player2, @player3]
    end
    
    it "is sorted by descending score" do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end

  it "computes points as the sum of all treasure points" do    
    expect(@player.points).to eq(0)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(50)
    @player.found_treasure(Treasure.new(:crowbar, 400))
    expect(@player.points).to eq(450)
    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(500)
  end
end
