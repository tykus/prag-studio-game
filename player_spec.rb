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
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it "computes a score as the sum of its health and the length of name" do
    expect(@player.score).to eq(150 + 5)
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
end
