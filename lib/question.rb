class Question
  attr_reader :text, :variants, :right_answer, :time_to_answer, :points

  def initialize(text, variants, right_answer, time_to_answer, points)
    @text = text
    @variants = variants.shuffle
    @right_answer = right_answer
    @time_to_answer = time_to_answer
    @points = points
  end

  def to_s
    "#{@text} (время: #{@time_to_answer}c. баллов: #{@points} #{@time_to_answer})"
  end
end

