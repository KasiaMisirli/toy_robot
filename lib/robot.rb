require_relative './grid'
require 'pry'

# The robot
class Robot
  attr_reader :x, :y, :f

  def initialize(x = 0, y = 0, f = 'NORTH')
    @x = x
    @y = y
    @f = f
  end

  def place(x, y, f)
    @x = x
    @y = y
    @f = f
    current_position
  end

  def next_position
    case f
    when 'NORTH'
      [x, y + 1]
    when 'SOUTH'
      [x, y - 1]
    when 'EAST'
      [x + 1, y]
    when 'WEST'
      [x - 1, y]
    end
  end

  def current_position
    [@x, @y, @f]
  end

  def move
    if @f == 'NORTH'
      @y += 1
    elsif @f == 'EAST'
      @x += 1
    elsif @f == 'SOUTH'
      @y -= 1
    else
      @x -= 1
    end
    current_position
  end

  def left
    @f = case @f
         when 'NORTH'
           'WEST'
         when 'WEST'
           'SOUTH'
         when 'SOUTH'
           'EAST'
         when 'EAST'
           'NORTH'
         end
    current_position
  end

  def right
    @f = case @f
         when 'NORTH'
           'EAST'
         when 'EAST'
           'SOUTH'
         when 'SOUTH'
           'WEST'
         when 'WEST'
           'NORTH'
         end
      
    current_position
  end

  def report
    report = "Robot is currently at (#{@x}, #{@y}) and it's facing #{@f}"
    puts report
    report
  end
end
