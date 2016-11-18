require 'toy_robot/version'
require 'toy_robot/file_reader'
require 'toy_robot/repl'

# simulation of a robot walking on a table
module ToyRobot
  def self.start(file)
    if file
      FileReader.process_file file
    else
      REPL.start
    end
  end
end
