require_relative 'card'

class Deck
  attr_reader :deck
  def initialize
    @deck = []
    (2..14).each do |value|
      [:hearts, :clubs, :diamonds, :spades].each do |suit|
        @deck << Card.new(value, suit)
      end
    end
  end

  def get_cards(num)
    taken = []
    num.times do
      taken << deck.pop
    end
    taken
  end

  def shuffle!
    @deck.shuffle!
  end

  def reset
    initialize
  end

  private

  # attr_reader :deck
end
