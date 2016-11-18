require 'toy_robot/controller'

module ToyRobot
  # executes instructions from file
  class FileReader
    def self.process_file(file)
      raise ArgumentError, 'Given argument is not a file.' unless
        File.file? file
      File.readlines(file).each do |line|
        ToyRobot::Controller.do line
      end
    end
  end
end
