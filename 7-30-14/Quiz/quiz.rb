#Isolate each hash in the $question array
#
#
#
class Quiz
@@questions = [
  {
    question: "How many days are there in a year?",
    choices: [
      "400",
      "345",
      "365",
      "366" ],
      answer: 2
  },
  {
    question: "Who was the first president?",
    choices: [
      "George Washington",
      "barack obama",
      "George Bush",
      "abraham lincoln"],
      answer: 0
  },
  {
     question: "What party is currently in office?",
     choices: [
       "Republican party",
       "Constitution Party",
       "Democratic Party",
       "Green Party"],
       answer: 2
  },
  {
     question: "Where is the color of the sky?",
     choices: [
       "Red",
       "Blue",
       "Yellow",
       "Black"],
       answer: 1
  },

  {
     question: "When is this quiz going to end?",
     choices: [
       "Tomorrow",
       "Never",
       "Right after this question",
       "Seriously Stop"],
       answer: 1
     }
     ]
  def initialize
    @correct_answers = 0
    @wrong_answers = 0
  end

  def ask_questions
      @@questions.shuffle!
      @@questions.each do |question|

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
        puts "You said #{user_input}"

        if user_input.downcase == correct_answer.downcase
          puts "Correct"
          @correct_answers += 1
        else
          puts "Wrong"
          @wrong_answers -= 1
        end
    end
    puts "Congratulations!! you got #{@correct_answers} right and #{@wrong_answers} out of #{questions.length}"
  end
end

quiz = Quiz.new
quiz.ask_questions
