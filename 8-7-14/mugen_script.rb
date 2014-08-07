require "./mugen.rb"


puts "Welcome! what Character would you like to select?"
puts
puts Character_list.join(" | ")
puts
char = gets.chomp
char.gsub( " ", "_" )
Game.new(char)
