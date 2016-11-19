require 'toy_robot/version'
require 'toy_robot/file_reader'
require 'toy_robot/repl'

# simulation of a robot walking on a table
module ToyRobot
  class << self
    def start(file)
      if file
        FileReader.process_file file
      else
        REPL.start
      end
    end

    def log(text)
      puts text
    end
  end
end
