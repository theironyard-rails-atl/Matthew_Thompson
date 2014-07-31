class Survey

  def initialize(statements)
    @statements = statements
    @ratings = []
  end

  def print_survey
    num = 1

    puts ""
    puts "Rate the following statements from 1 to 5."
    puts "1 being Strongly Dissagree and 5 being Strongly Agree"
    puts ""



    print "-" * 125
    puts ""

    @statements.each do |statement|
      print "#{statement}"
      user_input = gets.chomp.to_i
      @ratings << user_input
    end

    print "-" * 125
    puts ""

    results_with_statements = @statements.zip(@ratings)
    puts "Your results were:"
    results_with_statements.each do |pair|
      puts "#{num.to_s})#{pair.join(" => ")}"
      puts ""
      num += 1
    end
  end



end

import = IO.readlines("./survey_file.md")

#temp = [
#"Lebron James is the best player to play in the NBA",
#"The Miami Heat are still NBA Finals contenders",
#"The Cavaliers can bring home a championship with the new addition of Lebron",
#"Dwayne wade can become a leader for the Miami heat again",
#"Pat Riley is responsible for losing superstar Lebron James",
#]
survey = Survey.new(IO.readlines("./survey_file.md"))
survey.print_survey()
