#Isolate each hash in the $question array
#
#
#
class Quiz



  def initialize
    @correct_answers = []
    @wrong_answers = []

  end

  def ask_questions(arg)
      @questions_list = arg
      @questions_list.shuffle!
      @questions_list.each do |question|

        answer_index = question[:answer]
        correct_answer = question[:choices][answer_index]

        puts question[:question]
        num = 1
        question[:choices].each do |choice|
          puts "#{num}) #{choice}"
          num += 1
        end
        puts "Your Answer: "
        user_input = gets.chomp


        if user_input.downcase == correct_answer.downcase
          puts "Correct!"
          @correct_answers << question[:question]
        else
          puts "Wrong"
          @wrong_answers << question[:question]
      end
    end
  end

  def results
    puts "_" * 150
    puts "You got #{@correct_answers.length} correct and #{@wrong_answers.length} wrong."
  end
end

class Questions
attr_reader :questions_list

  def initialize
    @questions_list = []
  end


  def add new_question={}
    @new_question = new_question
    @questions_list << @new_question
    puts "There are #{@questions_list.length}"
  end




end

  #def modify_question(num)
    #@num = num -= 1
    #@selected_question = @questions[@num]
  #end
