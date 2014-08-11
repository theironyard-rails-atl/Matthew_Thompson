
  require "./mugen.rb"

  def player=(arg)
    @player = arg
  end

  def player
    @player
  end

  def opponent
    @opponent
  end

  def opponent=(arg)
    @opponent = arg
  end

  def grab_player_char
    @char = gets.chomp
    @char.downcase!
    initiate_player_char(@char)
  end

  def grab_opponent_char
    @char = gets.chomp
    @char.downcase!
    initiate_opponent_char(@char)
  end

  def initiate_player_char(char)
    @char = char
    if @char.include? "chuck norris"
    @player = Chuck_Norris.new
    elsif @char.include? "kung fu man"
    @player = Kung_fu_man.new
    else
    print ">"
    puts "Inccorect Input. Please try again."
      grab_player_char
    end
  end

  def initiate_opponent_char(char)
    @char = char
    if @char.include? "chuck norris"
    @opponent = Chuck_Norris.new
    elsif @char.include? "kung fu man"
    @opponent = Kung_fu_man.new
    else
    print ">"
    puts "Inccorect Input. Please try again."
      grab_opponent_char
    end

  end



  def start_vs_battle
    puts "#{@player} VS. #{@opponent}"
    print "..."
    sleep(3)
    puts "Fight!"
    while @player.alive? && @opponent.alive?
      @player.attack(@opponent)
    end
  end
  

puts "Welcome! what Character would you like to select?"
puts
puts Character_list.join(" | ")
puts
print ">"
grab_player_char
puts "Who whould you like to battle?"
puts Character_list.join(" | ")
puts
print ">"
grab_opponent_char
start_vs_battle
