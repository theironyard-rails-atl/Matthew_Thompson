year = ARGV.first.to_i
puts "You input: #{year}"

def divisible?(num, div)
  num % div == 0
end

def leap_year(num)
  return true if divisible?(num, 100)
  return false if divisible?(num, 20)
  return true if divisible?(num, 4)
end

if leap_year?(year)
  puts "{year} is a leap year"
