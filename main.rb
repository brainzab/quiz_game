require_relative 'lib/game'
require_relative 'lib/question'

#путь к файлу
file_path = "#{File.dirname(__FILE__)}/data/questions.xml"

game = Game.new(file_path)

game.questions.each do |que|
  puts game.ask_question(que)
  puts game.show_variants(que)
  puts 'Введите ответ:'
  print ">> "

  user_input = $stdin.gets.chomp

  game.answer_right?(user_input, que)

end

