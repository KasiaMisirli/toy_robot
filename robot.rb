

class Robot
  attr_reader :x, :y, :f
  
  def initialize(x=0,y=0,f="NORTH")
    @x = x
    @y = y
    @f = f
  end

  def place(x,y,f)
    if (x>=0 && x<5) && (y>=0 && y<5)
      @x = x
      @y = y
      @f = f
    end
  end

  def move
    current_position = [@x, @y, @f]
      # if (x>=0 && x<4) || (y>=0 && y<4)
      if @f == "NORTH"
        @y += 1
      elsif @f == "EAST"
        @x += 1
      elsif @f == "SOUTH"
        @y -= 1
      else
        @x -= 1
      end
    
    if @x < 0  || @y < 0 
      @x = current_position[0]
      @y = current_position[1]
      @f = current_position[2]
    end

  end

  def left
    if @f == "NORTH"
      @f = "WEST"
    elsif @f == "WEST"
      @f = "SOUTH"
    elsif @f == "SOUTH"
      @f = "WEST"
    else
      @f = "NORTH"
    end

  end

  def right
     if @f == "NORTH"
      @f = "EAST"
    elsif @f == "EAST"
      @f = "SOUTH"
    elsif @f == "SOUTH"
      @f = "WEST"
    else
      @f = "NORTH"
    end
  end

  def report
    "Robot is currently at (#{@x}, #{@y}) and it's facing #{@f}"
  end

  
end

