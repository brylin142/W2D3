require 'rspec'
require 'tdd'

describe "#my_uniq" do
  subject(:arr) {[0,1,2,3,4,4,4,4,5,5,5,6,6,6,7,3,4,5,7]}
  it "removes duplicates from array" do
    expect(my_uniq(arr)).to eq(arr.uniq)
  end
end

describe "Array#two_sum" do
  subject(:arr) {[-1,0,2,-2,1]}
  it "returns the indexes of array elements that sum to 0" do
    expect(arr.two_sum).to contain_exactly([0, 4], [2, 3])
  end
end

describe "#my_transpose" do
  subject(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  it "takes in a matrix and returns the transposition" do
    cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
    expect(my_transpose(matrix)).to eq(cols)
  end
end

describe "#stock_picker" do
  subject(:stock_prices) {[12,43,61,14,6,0,35,1,8,9] }
  it "takes in an array of stock prices and returns the most profitable pair of days" do
    expect(stock_picker(stock_prices)).to eq([0,2])
  end
end

describe TowersOfHanoi do
  subject(:towers_game) {TowersOfHanoi.new}
  describe "#move" do
    it "throws an error if the user selects an empty array" do
      expect{towers_game.move(1,0)}.to raise_error("invalid move")
    end
    it "doesn't allow user to move to tower with smaller disk" do
      towers_game.move(0,1)
      expect{towers_game.move(0,1)}.to raise_error("invalid move")
    end
    it "Correctly moves disk from one tower to another" do
      towers_game.move(0,1)
      expect(towers_game.towers[0]).to eq([3, 2])
      expect(towers_game.towers[1]).to eq([1])
    end
  end
  describe "#won?" do
    it "returns false if disks aren't on same tower" do
      towers_game.move(0,1)
      expect(towers_game.won?).to be false
    end
    it 'returns false if disks have not moved to a different tower' do
      expect(towers_game.won?).to be false
    end
    it 'return true if disks are on same tower that is not the original tower' do
      towers_game.towers[0] = []
      towers_game.towers[1] = [3,2,1]
      expect(towers_game.won?).to be true
    end
  end
end
