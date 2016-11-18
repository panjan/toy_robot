require 'toy_robot/controller'

module ToyRobot
  # executes instructions from the command line
  class REPL
    def self.start
      input = gets.chomp
      until input.casecmp('exit').zero?
        Controller.do input
        input = gets.chomp
      end
    end
  end
end
