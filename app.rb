require './robot'
require 'pry'

puts "Type in filename"
file_name = gets.chomp

def translate(line)
  if line.include? "PLACE"
    values = line.split(' ')[1].split(',')
    @robot.place(values[0].to_i,values[1].to_i,values[2])
    p @robot.report
  end
end

@robot = Robot.new

File.open("#{file_name}", "r") do |f|
  f.each_line do |line|
    # puts line
    translate(line)
    
    # binding.pry
    # how to get it to run things in robot.rb??
  end
end





# Any movement that would result in the robot falling from the table is prevented, however further valid movement commands are still allowed.

# The file is assumed to have ASCII encoding. It is assumed that the PLACE command has only one space, that is PLACE 1, 2, NORTH is an invalid command. All commands must be in upcase, all lower and mixed case commands will be ignored.

# Once the application receives these commands, it should run a simulation for a toy robot which obeys these commands and then if the list of commands includes a `REPORT` command, the application will then tell us where the robot is:

# $ toyrobot commands.txt

#   Robot is currently at (1, 2) and it's facing NORTH