 class Hangman
  def initialize answer
    @answer = answer
    @misses_remaining = 6
    @guessed = []
  end

  def misses_remaining
    @misses_remaining
  end

  def available_letters
    ('a'..'z').to_a - @guessed
  end

  def board
    # Take @answer and only show letters that the player has guessed
    result = ""
    @answer.split("").each do |char|
      if @guessed.include?(char)
        result += char
      else
        result += "_"
      end
    end
    result
  end


  #TODO: clean this up
  def guess(letter)
    @guessed << letter
    # Return true if the guess was right
    if @answer.include?(letter)
      @guessed << letter
      true
    else
      unless @guessed.include?(letter)
        @guessed << letter
        @misses_remaining -= 1
      end
      false
    end
  end

  def finished?
    won? || lost?
  end

  def won?
    !board.include?("_")
  end

  def lost?
    @misses_remaining.zero?
  end
end
