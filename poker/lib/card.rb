class Card
  attr_reader :face, :suit, :value

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def face
    return value.to_s if value.between?(2,10)
    case value
    when 11 then "Jack"
    when 12 then "Queen"
    when 13 then "King"
    when 14  then "Ace"
    end
  end

  def to_s
    "#{face} of #{suit.to_s.capitalize}"
  end

  def inspect
    to_s
  end

end
