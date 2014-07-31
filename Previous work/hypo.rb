#Define a function to find the hypotenuse of a right triangle with side lengths a and b
#a^2 + b^2 = c^2


  def hypo(a,b)
    @side_a = a
    @side_b = b
    total = Math.hypot(@side_a,@side_b).round


    puts "The Hypotenuse is #{total}"
  end
