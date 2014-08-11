Character_list = ["Kung fu man", "Chuck Norris"]


class Character
  attr_reader :max_damage, :difficulty, :character
  attr_accessor :life


  def initialize(difficulty=1)
    @difficulty = difficulty
    @life = 100
    @max_damage = @max_damage ||= 10
  end

  def damage
    rand(2..@max_damage)
  end

  def retaliation(other)
    self.life -= other.damage
      puts "They now have #{other.life}xp left"
      puts
      puts "They retaliated. You now have #{self.life}xp left"
    if self.dead?
      puts "Sorry you lose"
    end
  end

  def attack(other)
    other.life -= self.damage
    if other.alive?
      retaliation(other)
    else
      puts "He's Dead fool!"
      puts "Victory!"
    end
  end

  def alive?
    @life > 0
  end

  def dead?
    !alive?
  end
end


class Chuck_Norris < Character
  attr_reader :name


  def initialize(difficulty=1)
    @character = {:quotes => ["Chuck Norris does not produce tears, he exercises hs Crycepts", "Chuck Norris commited suicide once...He lived."]}
    @max_damage = 20
    @name = "Chuck Norris"
    super
  end

  def hit?
    if rand(1..6) > 3
      true
    end
  end


  def round_house_kick(other)
    if hit?
      other.life -= self.damage
      puts "Got'em!"
    else
      puts "Missed!"
    end
    retaliation(other)
  end

  def chuck_quote
    @character[:quotes].sample
  end

end



class Kung_fu_man < Character
  attr_reader :name

  def initialize(difficulty=1)
    @name = "Kung fu Man"
    super
  end

end

#class Game
#  attr_reader :char
#
#    @char = char.to_sym
#    char.new
#  end
#
#
#end
