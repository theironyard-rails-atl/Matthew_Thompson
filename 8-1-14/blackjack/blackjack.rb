class Card

attr_reader :rank, :suit

  def initialize(rank, suit)
    @card_input = rank
    @suit_input = suit
  end

  def value
    if (2..10).include?(@card_input)
      @card_input
    elsif [:K, :Q, :J].include?(@card_input)
      10
    else
      11
    end
  end

  def to_s
    "#{@card_input}, #{@suit_input}"
  end

end

class Deck
#attr_reader :cards, :drawn
#same as
#def cards
#  @cards
#end
#Suit_input = :C
#Card_input = 3
Full_deck =  {S: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               H: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               C: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               D: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]}
drawn = {S: [],
          H: [],
          C: [],
          D: []}


  def  initialize
    @full_deck = @@full_deck.
    @drawn = @@drawn

  end

  def cards
     @full_deck.values.flatten
    #return array's of all of @full_deck's values
  end

  def draw

    @



  end

  def drawn
    @drawn
  end

end

class Hand

  def initialize
    @current_hand = []

  end

  def add(*card




  end

  def value


  @hand_value.inject{ |sum,x| sum + x }
  end

end
