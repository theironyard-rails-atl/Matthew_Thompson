Dye = [1, 2, 3, 4, 5, 6]



class Yahtzee
  attr_accessor :roll, :chosen

  def initialize
    @dye = Dye
    @roll = []
    @chosen = []
  end

  def roll_dye
    5.times do
      @roll << @dye.sample
    end
    @roll
  end

  def choose_dye
    @chosen = 


  end

end
