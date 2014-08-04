class Card


  def initialize(r, s)
    @card_input = r
    @suit_input = s
  end

  def value
    if (2..10).include?(@card_input)
      num_card
    elsif [:K, :Q, :J].include?(@card_input)
      face_card
    else
      ace_card
    end
  end


  def num_card
    @value = @card_input
  end

  def face_card
    @value = 10
  end

  def ace_card
    @value = 1
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
@@full_deck =  {S: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               H: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               C: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K],
               D: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]}
@@drawn = {S: [],
          H: [],
          C: [],
          D: []}


  def  initialize
    @full_deck = @@full_deck
    @drawn = @@drawn

  end

  def cards
     @full_deck.values.flatten
    #return array's of all of @full_deck's values
  end

  def draw(c,s)
    @suit_input = s
    @card_input = c

    @full_deck = @full_deck[@suit_input].delete(@card_input)
    @drawn = @drawn[@suit_input] << @card_input


    initialize
  end

  def drawn
    @drawn
  end

end

class Hand

  def initialize
    @current_hand = []
    @hand_value = []
  #  @num_drawn = 0
  end

  def add(*args)
    @new_draws = args
  #  if @num_drawn == 0
        args.each do |card|
          @current_hand << card
        end

        @hand_value << @new_draws.value

#        @current_hand.each do |card|
#          @hand_value << card.value
#        end
#
    #  end
  #  else
    #  @current_hand << args


  #@num_drawn += args.count
end

  def value
  @hand_value.inject{ |sum,x| sum + x }
  end

end
