module HasHitPoints
  def alive?
    self.hit_points > 0
  end

  def dead?
    !alive?
  end
end

module Zombifiable
  def reanimate
    if dead?
      @hit_points = Float::INFINITY
    end
  end

  def headshot
    puts "Boom!"
    @hit_points = 0
  end
end


class Adventurer
  attr_reader :max_damage, :level
  attr_accessor :hit_points

  # This is a Mixin
  include HasHitPoints
  # if conan = Adventurer.new
  # defines
  #   conan.alive?
  #   conan.dead?
  # ok because conan.hit_points works

  # `extend` HasHitPoints would define
  # Adventurer.alive?
  # Adventurer.dead?
  # but Adventurer.hit_points won't work

  def initialize(level=1)
    @level = level

    @max_damage = @max_damage || 4
    # a += 1  --> a = a + 1
    # a ||= 1 --> a = a || 1
    # @hit_points_per_level = @hit_points_per_level || 10
    @hit_points_per_level ||= 10 # set a default

    @hit_points = @level * @hit_points_per_level
  end

  def damage
    rand(1..@max_damage)
  end

  def attack(other)
    # other.hit_points = other.hit_points - self.damage
    other.hit_points -= self.damage
  end
end


class Villager < Adventurer
  include Zombifiable
end


class Warrior < Adventurer
  def initialize(weapon, level=1)
    @weapon = weapon
    @max_damage = 8
    @hit_points_per_level = 15
    super(level)
  end

  def savage_attack(other)
    puts "Attacking with a(n) #{@weapon}"
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
    # The other adventurer gets a free swing while your
    #   defenses are down
    other.attack(self) unless other.dead?
  end
end


class Wizard < Adventurer
  attr_accessor :potions

  def initialize(level=1)
    @weapon = "dagger"
    @hit_points_per_level = 8
    @mana, @potions = 10, 5
    super # or super(level)
  end

  def drink_potion
    if @potions > 0
      puts "You drink a potion"
      @mana += 10
      @potions -= 1
    else
      puts "You are out of potions"
    end
  end

  def magic_missle(other)
    if @mana < 5
      puts "Not enough mana"
      # Early return, doesn't execute anything else in this function
      return
    else
      @mana -= 5
    end

    # if rand(1..6) > 2
    #   hit = true
    # else
    #   hit = false
    # end
    hit = rand(1..6) > 2
    # or
    # max = (@level / 2) + 6 & rand(1..max)

    if hit
      puts "I attack the darkness"
      other.hit_points -= rand(6..100)
    else
      puts "You missed the darkness"
      other.hit_points
    end
  end
end


class Monster
  attr_reader :level
  attr_accessor :hit_points

  include HasHitPoints
  include Zombifiable

  def initialize(level)
    @level = level
    @hit_points = 0
    level.times { @hit_points += rand(1..8) }
  end

  def attack(other)
    roll = rand(1..6)
    damage = roll

    while roll == 6
      roll = rand(1..6)
      damage += roll
    end

    other.hit_points -= damage
  end
end
