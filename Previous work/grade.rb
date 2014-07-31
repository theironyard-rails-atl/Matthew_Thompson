

  def letter_grade(num)
    puts "You entered: #{num}"
      case(num.to_i)
            when 90..100
              puts "A"
            when 80..89
              puts "B"
            when 70..79
              puts "C"
            when 60..69
              puts "D"
            when 0..59
              puts "F"
      end
  end

  def random_grades
    students = 25.times.map { rand(1..100) }
    a_count = 0

      students.map do |student|
          if student >= 90 && student <= 100
                a_count += 1
          end
      end
      puts a_count
  end
