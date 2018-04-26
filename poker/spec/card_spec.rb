require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(13, :hearts) }
  # let(:test_card) {double(value: 13, suit: :hearts)}

  describe "#initialize" do
    it "Creates a new card with value" do
      expect(card.value).to eq(13)
    end
    it "Creates a new card with suit" do
      expect(card.suit).to eq(:hearts)
    end
  end

  describe "#face" do
    it "Returns a string" do
      expect(card.face).to be_a(String)
    end
    context "when card is a face card" do
      it "returns a face card name" do
        expect(card.face).to eq("King")
      end
    end
  end
  describe "#to_s" do
    it "returns a string with face and suit" do
      expect(card.to_s).to eq("King of Hearts")
    end
  end
end
