require 'toy_robot/robot'

module ToyRobot
  # executes given commands
  class Controller
    def self.robot
      @robot ||= Robot.new
    end

    def self.do(command)
      sanitized_cmd = command.chomp.downcase
      case sanitized_cmd
      when /^place (\d+),(\d+),(#{Robot::DIRECTIONS.join('|')})$/
        robot.place! $1.to_i, $2.to_i, $3
      when 'move', 'left', 'right'
        robot.send("#{sanitized_cmd}!")
      when 'report'
        robot.report
      else
        ToyRobot.log "Invalid command: #{command}"
      end
    end
  end
end
