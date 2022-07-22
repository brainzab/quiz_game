# frozen_string_literal: true

require 'rexml/document'
require 'timeout'
require_relative 'question'

class Game
  attr_accessor :right_answers, :total_points

  def initialize
    @right_answers = 0
    @total_points = 0
  end

  def total_points_count(question)
    @total_points += question.points
  end

  def right_answers_count
    @right_answers += 1
  end

  def result
    "Игра окончена! Вы дали #{right_answers} правильных ответов, набрали #{total_points} баллов"
  end

  def time_to_answer(question)
    question.time_to_answer
  end
end

