# frozen_string_literal: true

require_relative 'lib/question_parser'
require_relative 'lib/question'
require_relative 'lib/game'
require 'rexml/document'
require 'timeout'

questions = QuestionParser.parse_xml("#{File.dirname(__FILE__)}/data/questions.xml")

game = Game.new

questions.each do |que|
  puts que.ask_question
  puts que.show_variants
  print '> '
  puts 'Введите ответ:'

  begin
    user_input = Timeout.timeout(game.time_to_answer(que)) do
      $stdin.gets.to_i
    end
  rescue Timeout::Error
    puts "Время вышло! Правильный ответ: #{que.show_right_answer}"
    next
  end

  if que.answer_right?(user_input)
    puts 'Правильно!'
    game.total_points_count(que)
    game.right_answers_count
  else
    puts "Не правильно! Правильный ответ: #{que.show_right_answer}"
  end
end

puts game.result
