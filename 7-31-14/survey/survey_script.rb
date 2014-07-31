require "./survey.rb"


puts "Starting survey"
survey = Survey.new(IO.readlines("./survey_file.md"))
survey.print_survey()
