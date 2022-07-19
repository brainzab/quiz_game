# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/question'

file_path = "#{File.dirname(__FILE__)}/data/questions.xml"

game = Game.new(file_path)

game.questions.each do |que|
  puts game.ask_question(que)
  puts game.show_variants(que)
  puts 'Введите ответ:'

  begin
    user_input = Timeout.timeout(game.time_to_answer(que)) {
      $stdin.gets.to_i
    }
  rescue Timeout::Error
    puts "Время вышло! Правильный ответ: #{game.show_right_answer(que)}"
    next
  end

  game.answer_right?(user_input, que)

end

puts game.game_result


