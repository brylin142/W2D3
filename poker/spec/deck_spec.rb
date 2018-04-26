require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "initializes with 52 cards" do
      expect(deck.deck.count).to eq(52)
    end
    it "initializes with unique cards" do
      expect(deck.deck.uniq).to eq(deck.deck)
    end
  end

  describe "#get_cards" do
    it "returns the number of cards passed in" do
      hand = deck.get_cards(5)
      expect(hand.length).to eq(5)
    end
    it "the deck gets reduced by the number of cards" do
      hand = deck.get_cards(5)
      expect(deck.deck.length).to eq(47)
    end

  end

  describe "#shuffle" do
    it "shuffles the deck" do
      unshuffled = deck.deck.dup
      deck.shuffle!
      expect(deck.deck).not_to eq(unshuffled)
    end
  end

  describe "#reset" do
    it "returns all cards to the deck" do
      deck.get_cards(10)
      deck.reset
      expect(deck.deck.count).to eq(52)
    end
  end
end
