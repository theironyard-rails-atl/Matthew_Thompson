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
    rand(0..@max_damage)
  end

  def retaliation(other)
    if other.alive?
      puts "They now have #{other.life}xp left"
      puts
      self.life -= other.damage
      puts "They retaliated. You now have #{self.life}xp left"
    else
      puts "Victory is yours! Now party hardy ;)"
    end
  end

  def attack(other)
    if other.alive?
      other.life -= self.damage
      retaliation(other)
    else
      puts "He's Dead fool!"
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


  def initialize(difficulty=1)
    @character = {:quotes => ["Chuck Norris does not produce tears, he exercises hs Crycepts", "Chuck Norris commited suicide once...He lived."]}
    @max_damage = 20
  end

  def hit?
    if rand(1..6) > 3
      true
    end
  end


  def round_house_kick(other)
    if hit?
      other.life -= self.damage
    else
      puts "Missed!"
    end
    retaliation
  end

  def chuck_quote
    @character[:quotes].sample
  end

end



class Kung_fu_man < Character
  attr_reader :character

  def initialize(difficulty=1)
    @character = "Kung fu Man"
    super
  end

end

class Game
  attr_reader :char

  def initialize(char)
    @char = char
    char.new
  end


end
