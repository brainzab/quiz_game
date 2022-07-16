class Question
  attr_reader :text, :variants, :time_to_answer, :points

  def initialize(text, variants, time_to_answer, points)
    @text = text
    @variants = variants
    @time_to_answer = time_to_answer
    @points = points
  end

  def to_s
    @variants.map.with_index(1) do |variant, index|
      "#{index}. #{variant[1]}"
    end
  end
end
