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
    it "returns the indexes of array elements that sum to 0"
    expect(arr.two_sum).to contain_exactly([0, 4], [2, 3])
end
