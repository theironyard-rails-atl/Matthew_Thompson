class Averager

  #Define an Averager class that can compute the average of two numbers. Bonus: any number of numbers

  def initialize
  end

  def avg(array = [])
    @array = array
    sum = 0
    @array.map { |x| sum += x }
    return sum/list.length
  end



end
