require_relative 'deck'

class Hand
  attr_reader :cards, :deck
  def initialize(deck)
    @cards = []
    @deck = deck
  end

  def highest_hand
    hands = straight_flush + four_of_a_kind + full_house + flush + straight + three_of_a_kind + two_pair + pair
    hands.first
  end

  def add_cards_to_hand(cards)
    @cards += cards
  end

  def get_cards_from_deck(num)
    num.times { cards << deck.deck.pop}
  end

  def discard(index)
    @cards = @cards.drop(index + 1) + @cards.take(index)
  end

  def pair
    pairs = @cards.combination(2).select do |card1, card2|
      card1.value == card2.value
    end
    pairs
  end

  def two_pair
    pairs = pair
    if pairs.length == 2 && pairs[0][0].value != pairs[1][0].value
      return pairs
    else
      []
    end
  end

  def three_of_a_kind
    triple = @cards.combination(3).select do |c1, c2, c3|
      c1.value == c2.value && c2.value == c3.value
    end
    triple
  end

  def straight
    @cards.map(&:value).sort.inject do |acc,el|
      return [] unless el == acc+1
      el
    end
    [@cards]
  end

  def flush
    @cards.map(&:suit).sort.inject do |acc,el|
      return [] unless el == acc
      el
    end
    [@cards]
  end

  def full_house
    pair.count > 1 && three_of_a_kind.count > 0 ? [@cards] : []
  end

  def four_of_a_kind
    quad = @cards.combination(4).select do |c1, c2, c3, c4|
      c1.value == c2.value && c2.value == c3.value && c3.value == c4.value
    end
    quad
  end

  def straight_flush
    @cards.sort_by {|c|c.value}.inject do |acc,el|
      return [] unless el.value == acc.value+1 && acc.suit == el.suit
      el
    end
    [@cards]
  end
end
