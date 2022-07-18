require "rexml/document"
include REXML

class Game
  attr_reader :true_answer, :total_points, :questions

  def initialize(file_path)
    @questions = parse_questions_xml(file_path)
    @true_answer = 0
    @total_points = 0
    @current_question_index
  end

  def parse_questions_xml(file_path)
    doc = Document.new(File.new(file_path))

    doc.root.elements.map do |item|
      text = item.elements["text"].text
      variants = item.elements["variants"].elements.map(&:text).shuffle
      correct_answer = item.elements["variants"].elements.detect {|item| item.attributes["right"] == "true"}.text
      points = item.attributes["points"].to_i
      time_to_answer = item.attributes["seconds"].to_i
      Question.new(text, variants, correct_answer, points, time_to_answer)
    end
  end

  def ask_question(question)
    puts question.time_to_answer
  end

end


