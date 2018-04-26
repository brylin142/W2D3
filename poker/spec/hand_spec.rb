require 'rspec'
require 'hand'

describe Hand do
  let(:deck) {Deck.new}

  subject(:hand) {Hand.new(deck)}
  describe "#initialize" do
    it "starts with empty cards array" do
      expect(hand.cards).to be_empty
    end
    it "takes in a deck" do
      expect(hand.deck).to be_a(Deck)
    end
  end

  describe "#get_cards_from_deck" do
    it "adds number of cards to hand that were passed in" do
      hand.get_cards_from_deck(5)
      expect(hand.cards.length).to eq(5)
    end
  end

  describe "#discard" do
    it "removes the card at the index passed in" do
      hand.get_cards_from_deck(5)
      removed = hand.cards[0]
      hand.discard(0)
      expect(hand.cards).to_not include(removed)
    end
  end

  describe "#pair" do
    it "returns an array containing any pairs in the hand" do
      pair = [Card.new(2,:hearts),  Card.new(2,:spades)]
      hand.add_cards_to_hand(pair)
      expect(hand.pair).to include(pair)
    end
  end

  describe "#three_of_a_kind" do
    it "returns an array containing any triples in the hand" do
      triple = [Card.new(2,:hearts),  Card.new(2,:spades), Card.new(2,:clubs)]
      hand.add_cards_to_hand(triple)
      expect(hand.three_of_a_kind).to include(triple)
    end
  end

  describe "#straight" do
    it "returns an array containing a straight" do
      straight = [
        Card.new(2,:hearts),
        Card.new(3,:spades),
        Card.new(4,:clubs),
        Card.new(5,:clubs),
        Card.new(6,:diamonds)
      ]
      hand.add_cards_to_hand(straight)
      expect(hand.straight).to include(straight)
    end

    it "returns an empty array if there is no straight" do
      straight = [
        Card.new(2,:hearts),
        Card.new(3,:spades),
        Card.new(4,:clubs),
        Card.new(5,:clubs),
        Card.new(8,:diamonds)
      ]
      hand.add_cards_to_hand(straight)
      expect(hand.straight).to be_empty
    end
  end

  describe "#flush" do
    it "returns a array containing a flush" do
      flush = [
        Card.new(2,:hearts),
        Card.new(8,:hearts),
        Card.new(12,:hearts),
        Card.new(7,:hearts),
        Card.new(11,:hearts)
      ]
      hand.add_cards_to_hand(flush)
      expect(hand.flush).to include(flush)
    end

    it "returns an empty array if there is no flush" do
      flush = [
        Card.new(2,:hearts),
        Card.new(8,:diamonds),
        Card.new(12,:hearts),
        Card.new(7,:hearts),
        Card.new(11,:hearts)
      ]
      hand.add_cards_to_hand(flush)
      expect(hand.flush).to be_empty
    end
  end

  describe "#full_house" do
    it "returns an array containing a full house" do
      full_house = [
        Card.new(2,:hearts),
        Card.new(2,:diamonds),
        Card.new(2,:spade),
        Card.new(7,:hearts),
        Card.new(7,:clubs)
      ]
      hand.add_cards_to_hand(full_house)
      expect(hand.full_house).to include(full_house)
    end

    it "returns an empty arry if there is no full house" do
      full_house = [
        Card.new(2,:hearts),
        Card.new(2,:diamonds),
        Card.new(3,:spade),
        Card.new(7,:hearts),
        Card.new(7,:clubs)
      ]
      hand.add_cards_to_hand(full_house)
      expect(hand.full_house).to be_empty
    end
  end

  describe "#four_of_a_kind" do
    it "returns an array containing a four of a kind" do
      quad = [
        Card.new(2,:hearts),
        Card.new(2,:diamonds),
        Card.new(2,:spade),
        Card.new(2,:clubs)
      ]
      hand.get_cards_from_deck(1)
      hand.add_cards_to_hand(quad)
      expect(hand.four_of_a_kind).to include(quad)
    end

    it "returns an empty array if there is no four of a kind" do
      quad = [
        Card.new(2,:hearts),
        Card.new(2,:diamonds),
        Card.new(3,:spade),
        Card.new(2,:clubs)
      ]
      hand.add_cards_to_hand(quad)
      expect(hand.four_of_a_kind).to be_empty
    end
  end

  describe "#straight_flush" do
    it "returns an array containing a straight flush" do
      straight_flush = [
        Card.new(10,:clubs),
        Card.new(11,:clubs),
        Card.new(12,:clubs),
        Card.new(13,:clubs),
        Card.new(14,:clubs)
      ]
      hand.add_cards_to_hand(straight_flush)
      expect(hand.straight_flush).to include(straight_flush)
    end

    it "returns empty array if no straight flush" do
      straight_flush = [
        Card.new(10,:clubs),
        Card.new(11,:clubs),
        Card.new(12,:clubs),
        Card.new(13,:hearts),
        Card.new(11,:diamonds)
      ]
      hand.add_cards_to_hand(straight_flush)
      expect(hand.straight_flush).to be_empty
    end
  end

  describe "#highest_hand" do
    it "returns highest hand" do
      straight_flush = [
        Card.new(10,:clubs),
        Card.new(11,:clubs),
        Card.new(12,:clubs),
        Card.new(13,:clubs),
        Card.new(14,:clubs)
      ]
      hand.add_cards_to_hand(straight_flush)
      expect(hand.highest_hand).to eq(straight_flush)
    end
  end
end
