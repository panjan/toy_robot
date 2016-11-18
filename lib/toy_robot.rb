require "toy_robot/version"

module ToyRobot
  class << self
    def start(arg)
      if arg
        puts 'file'
      else
        puts 'repl'
      end
    end
  end
end
