class Rover

  attr_reader :position_x
  attr_reader :position_y
  attr_reader :orientation

  def initialize
    landing_coords = Random.new
    @position_x = landing_coords.rand(10)
    @position_y = landing_coords.rand(10)
    @orientation =
    case landing_coords.rand(4)
    when 0
      :North
    when 1
      :East
    when 2
      :South
    when 3
      :West
    end
  end

  def read_instruction (instructions)
    instruction = instructions.to_s.upcase[0]
    case instruction
    when 'M'
      self.move
    when 'L'
      self.turn(:Left)
    when 'R'
      self.turn(:Right)
    end
    self.report
  end

  def move
    case @orientation
    when :North
      @position_y += 1
    when :East
      @position_x += 1
    when :South
      @position_y -= 1
    when :West
      @position_x -= 1
    end
  end

  def turn(direction)
    puts "turn"
    case @orientation
    when :North
      if (direction == :Left)
        @orientation = :West
      elsif (direction == :Right)
        @orientation = :East
      end
    when :East
      if (direction == :Left)
        @orientation = :North
      elsif (direction == :Right)
        @orientation = :South
      end
    when :South
      if (direction == :Left)
        @orientation = :East
      elsif (direction == :Right)
        @orientation = :West
      end
    when :West
      if (direction == :Left)
        @orientation = :South
      elsif (direction == :Right)
        @orientation = :North
      end
    end
  end

  def report
    [@position_x, @position_y, @orientation]
  end
end
