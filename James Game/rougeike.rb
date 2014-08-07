class Adventurer
  attr_reader :max_damage, :level
  attr_accessor :hit_points

  def initialize(level=1)
    @level = level
    @max_damage = @max_damage || 4

    @hit_points_per_level ||= 10
    @hit_point = @level * @hit_points_per_level
  end


  def damage
    rand(1..@max_damage)
  end

  def attack(other)
    other.hit_points -= self.damage
  end

  def alive?
    @hit_points > 0
  end

  def dead?
    !alive?
  end


end

class Villager < Adventurer
end

class Warrior < Adventurer
  def initialize(weapon, level=1)
    @weapon = weapon
    @max_damage = 8
    @hit_points_per_level = 15
    super(level) #Imports methods from the parent function. It is important where this is pla
  end

  def savage_attack(other)
    puts "Attacking with a(n) #{@weapon}"
    num_attacks = (@level / 3) + 1
    num_attacks.times {self.attack(other) }
    other.attack(self) unless other.dead?
  end
end

class Wizard < Adventurer
  attr_accessor :potioins

  def initialize(level=1)
    @hit_points_per_level = 8
    @mana, @potions = 10, 5
    super
  end

  def drink_potions
    if @potions > 0
      puts "You drink potion"
    @mana += 10
    @potions -= 1
    else
      puts "You are out of potion"
    end
  end

  def magic_missle(other)
    if @mana < 5
      puts "Not enough mana"
      return
    else
      @mana -= 5
    end

    hit = rand(1..6) > 2

    if hit
      puts "I attack the darkness"
      other.hit_points -= rand(6..100)
    else
      puts "Missed!"
    end
  end

end

class Monster
  attr_reader :level
  attr_accessor :hit_points

  def initialize(level)
    @level = level
    @hit_points = 0
    level.times { @hit_points += rand(1..8)}
  end

  def attack(other)
    roll = rand(1..6)
    damage = roll

    while roll == 6
      roll = rand(1..6)
      damange += roll
    end

    other.hit_points -=
  end
end
