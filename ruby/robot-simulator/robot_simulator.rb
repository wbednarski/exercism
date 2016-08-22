class Robot
  attr_accessor :coordinates, :bearing

  DIRECTIONS = [:north, :east, :south, :west].freeze

  def initialize
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise ArgumentError, "Only #{DIRECTIONS} directions are allowed!" unless DIRECTIONS.include?(direction)
    @bearing = direction
  end

  def at(x, y)
    @coordinates[0] = x
    @coordinates[1] = y
  end

  def advance
    case @bearing
    when :north then @coordinates[1] += 1
    when :east  then @coordinates[0] += 1
    when :south then @coordinates[1] -= 1
    when :west  then @coordinates[0] -= 1
    end
  end

  def turn_right
    @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing) + 1) % 4]
  end

  def turn_left
    @bearing = DIRECTIONS[(DIRECTIONS.index(@bearing) - 1) % 4]
  end
end

class Simulator
  COMMANDS = {
    'A' => :advance,
    'R' => :turn_right,
    'L' => :turn_left
  }.freeze

  def instructions(move)
    move.chars.map { |direction| COMMANDS[direction] }
  end

  def place(robot, params = {})
    robot.coordinates = [params[:x], params[:y]]
    robot.orient params[:direction]
  end

  def evaluate(robot, commands)
    instructions(commands).each { |command| robot.send command }
  end
end
