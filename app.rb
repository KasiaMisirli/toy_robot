require './robot'
require './grid'
require 'pry'

puts "Type in filename"

class App
  def initialize
    @file_name = "commands.txt"
    @robot = Robot.new
    @grid = Grid.new
  end 

  def open_file(file_name)
    File.open("#{file_name}", "r") do |f|
      f.each_line do |line|
        translate(line)
      end
    end
  end

  def translate(line)
    if line.include? "PLACE"
      x,y,f = line.split(' ')[1].split(',')
      x = x.to_i
      y= y.to_i
      if @grid.valid_move?(x,y)
        @robot.place(x,y,f)
      end
    elsif line.include? "MOVE"
      x,y = @robot.next_position
      if @grid.valid_move?(x,y)
        @robot.move
      end
    elsif line.include? "LEFT"
      @robot.left
    elsif line.include? "RIGHT"
      @robot.right
    elsif line.include? "REPORT"
      @robot.report
    end
  end

end



# Any movement that would result in the robot falling from the table is prevented, however further valid movement commands are still allowed.

# The file is assumed to have ASCII encoding. It is assumed that the PLACE command has only one space, that is PLACE 1, 2, NORTH is an invalid command. All commands must be in upcase, all lower and mixed case commands will be ignored.

# Once the application receives these commands, it should run a simulation for a toy robot which obeys these commands and then if the list of commands includes a `REPORT` command, the application will then tell us where the robot is:

# $ toyrobot commands.txt

#   Robot is currently at (1, 2) and it's facing NORTH