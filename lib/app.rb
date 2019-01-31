require_relative 'robot'
require_relative 'grid'
require 'pry'

# Where everything happens
class App
  def initialize
    @robot = Robot.new
    @grid = Grid.new
  end

  def open_file(*file_name)
    file_name = ARGV[0]
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

  def translate(line)
    if line.start_with? 'PLACE'
      x, y, f = line.split(' ')[1].split(',')
      x = x.to_i
      y = y.to_i
      @robot.place(x, y, f) if @grid.valid_move?(x, y)
      @robot.current_position
    elsif line.include? 'MOVE'
      x, y = @robot.next_position
      @robot.move if @grid.valid_move?(x, y)
      @robot.current_position
    elsif line.include? 'LEFT'
      @robot.left
    elsif line.include? 'RIGHT'
      @robot.right
    elsif line.include? 'REPORT'
      @robot.report
    else
      @robot.current_position
    end
  end
end

a = App.new
a.open_file(ARGV)
