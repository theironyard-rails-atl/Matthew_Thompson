class LetterCounter


  def initialize
    @letter = "a"
    @count_hash = {}
  end

  def count_meh
    puts "Enter a string: "
    user_input = gets.chomp.downcase

    while @letter.length == 1
      
         letter_add = user_input.count("#{@letter}")
         @count_hash.store(@letter.to_s, letter_add)
         @letter.succ!

    end

    puts @count_hash
  end

count = LetterCounter.new
count.count_meh

end
