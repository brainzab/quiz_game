# frozen_string_literal: true

class QuestionParser
  QUESTIONS_TO_PLAY = 5

  def self.parse_xml(file)
    doc = REXML::Document.new(File.new(file))

    doc.root.elements.map do |item|
      text = item.elements['text'].text
      variants = item.elements['variants'].elements.map(&:text)
      correct_answer = item.elements['variants'].elements.detect { |item| item.attributes['right'] == 'true' }.text
      points = item.attributes['points'].to_i
      time_to_answer = item.attributes['seconds'].to_i
      Question.new(text, variants, correct_answer, time_to_answer, points)
    end.sample(QUESTIONS_TO_PLAY)
  end
end
