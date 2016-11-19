module ToyRobot
  # walks on a table and never falls down
  class Robot
    DIRECTIONS = %w(north east south west).freeze

    attr_reader :x, :y

    def initialize(width = 5, height = 5)
      @width = width
      @height = height
    end

    def place!(x, y, direction)
      return unless x.between?(0, @height - 1) && y.between?(0, @width - 1)
      @direction = DIRECTIONS.index direction
      @x = x
      @y = y
    end

    def direction
      DIRECTIONS[@direction]
    end

    def move!
      @y += 1 if direction == 'north' && @y < @height - 1
      @y -= 1 if direction == 'south' && @y > 0
      @x += 1 if direction == 'east' && @x < @width - 1
      @x -= 1 if direction == 'west' && @x > 0
    end

    def left!
      @direction = (@direction - 1) % 4 if @direction
    end

    def right!
      @direction = (@direction + 1) % 4 if @direction
    end

    def report
      ToyRobot.log "#{@x},#{@y},#{direction.upcase}"
    end
  end
end
