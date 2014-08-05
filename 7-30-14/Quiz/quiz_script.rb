require "./quiz.rb"


def add_questions
  @questions = Questions.new
  @questions.add(question: "sample_1", choices: ["400","345","365","366"], answer: 2)
  @questions.add(question: "sample_2", choices: ["400","345","365","366"], answer: 2)
end

def begin_quiz
  @quiz = Quiz.new
  @quiz.ask_questions(@questions.questions_list)
end

def display_results
  @quiz.results
end

add_questions
begin_quiz
display_results
