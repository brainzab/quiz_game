# frozen_string_literal: true

require 'rexml/document'
require 'timeout'

class Game
  QUESTIONS_TO_PLAY = 5

  attr_reader :questions, :right_answers, :total_points

  def initialize(file_path)
    @questions = parse_questions(file_path).sample(QUESTIONS_TO_PLAY)
    @right_answers = 0
    @total_points = 0
  end

  def parse_questions(file_path)
    doc = REXML::Document.new(File.new(file_path))

    doc.root.elements.map do |item|
      text = item.elements['text'].text
      variants = item.elements['variants'].elements.map(&:text)
      correct_answer = item.elements['variants'].elements.detect { |item| item.attributes['right'] == 'true' }.text
      points = item.attributes['points'].to_i
      time_to_answer = item.attributes['seconds'].to_i
      Question.new(text, variants, correct_answer, time_to_answer, points)
    end
  end

  def to_s
    "#{@text} (время: #{@time_to_answer}c. баллов: #{@points})"
  end

  def ask_question(question)
    "#{question.text} (баллы - #{question.points}, время на ответ - #{question.time_to_answer} сек.)"
  end

  def answer_right?(answer, question)
    if answer == question.variants.find_index(question.right_answer) + 1
      puts 'Правильно!'
      @right_answers += 1
      @total_points += question.points
    else
      puts "Не правильно! Правильный ответ - #{question.right_answer}"
    end
  end

  def show_variants(question)
    question.variants.map.with_index(1) { |variant, index| "#{index}. #{variant}" }
  end

  def game_result
    "Игра окончена! Вы дали #{right_answers} правильных ответа из #{QUESTIONS_TO_PLAY}, набрали #{total_points} баллов"
  end

  def time_to_answer(question)
    question.time_to_answer
  end

  def show_right_answer(question)
    question.right_answer
  end
end
