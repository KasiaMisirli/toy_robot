require_relative 'robot'
require_relative 'grid'
require 'pry'

# Where everything happens
class App
  def initialize
    @robot = Robot.new
    @grid = Grid.new
  end

  def open_file(file_name)
    all_commands = []
    File.open(file_name, 'r') do |f|
      f.each_line do |line|
        all_commands.push(line)
      end
    end
    filter_commands(all_commands)
  end


  def filter_commands(commands)
    index_of_place = commands.index { |c| c.include? 'PLACE' }
    commands_we_want = commands[index_of_place..commands.length - 1]
    commands_we_want.each { |command| translate(command) }
  end

  def translate(line) # rubocop:disable Metrics/MethodLength
    command, args = line.split(' ')
    case command
    when 'PLACE'
      place(*args.split(','))
    when 'MOVE'
      move(*@robot.next_position)
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      @robot.report
    else
      @robot.current_position
    end
  end

  def place(x, y, f)
    x = x.to_i
    y = y.to_i
    @robot.place(x, y, f) if valid_move?(x, y)
    @robot.current_position
  end

  def move(x, y)
    @robot.move if valid_move?(x, y)
    @robot.current_position
  end

  def valid_move?(x, y)
    @grid.valid_move?(x, y)
  end
end