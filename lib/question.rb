# frozen_string_literal: true

class Question
  attr_accessor :text, :variants, :right_answer, :time_to_answer, :points

  def initialize(params)
    @text = params[:text]
    @variants = params[:variants].shuffle!
    @right_answer = params[:right_answer]
    @time_to_answer = params[:time_to_answer]
    @points = params[:points]
  end

  def show_variants
    variants.map.with_index(1) { |variant, index| "#{index}. #{variant}" }
  end

  def ask_question
    "#{text} (баллы - #{points}, время на ответ - #{time_to_answer} сек.)"
  end

  def answer_right?(user_answer)
    user_answer == variants.find_index(right_answer) + 1
  end

  def show_right_answer
    right_answer
  end
end
