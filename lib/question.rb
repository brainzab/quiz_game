class Question
  attr_reader :text, :variants, :correct_answer, :time_to_answer, :points

  def initialize(text, variants, correct_answer, time_to_answer, points)
    @text = text
    @variants = variants.shuffle
    @correct_answer = correct_answer
    @time_to_answer = time_to_answer
    @points = points

  end

  def to_s
    "#{@text} (время: #{@time_to_answer}c. баллов: #{@points})"
  end

end

