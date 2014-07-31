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
      puts "#{statement}"
      print "Rate => "
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

    print "_" * 130
    puts "Your Highest rating was: #{@ratings.max}"
    puts "Your Lowest rating was: #{@ratings.min}"
    puts "Your Average rating was: #{((@ratings.inject{ |sum,x| sum + x })/@statements.length).round(2)}"
  end



end
