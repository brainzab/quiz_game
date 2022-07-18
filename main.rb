#require "rexml/document"
require_relative 'lib/game'
require_relative 'lib/question'
require "rexml/document"
include REXML



#путь к файлу
file_path = "#{File.dirname(__FILE__)}/data/questions.xml"

game = Game.new(file_path)

game.questions.each do |que|
  puts game.ask_question(que)
end
