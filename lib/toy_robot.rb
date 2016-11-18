require 'toy_robot/version'
require 'toy_robot/file_reader'

# simulation of a robot walking on a table
module ToyRobot
  class << self
    def start(file)
      if file
        FileReader.process_file file
      else
        start_repl
      end
    end

    def start_repl
      raise NotImplementedError
    end
  end
end
