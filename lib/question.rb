# frozen_string_literal: true

class Question
  attr_reader :text, :variants, :right_answer, :time_to_answer, :points

  def initialize(text, variants, right_answer, time_to_answer, points)
    @text = text
    @variants = variants.shuffle
    @right_answer = right_answer
    @time_to_answer = time_to_answer
    @points = points
  end
end
