require_relative './robot'

# Grid where robot is to be placed. Handles edges.
class Grid
  attr_reader :hori, :verti
  def initialize(hori = 5, verti = 5)
    @hori = hori
    @verti = verti
  end

  def valid_move?(x, y)
    (x >= 0 && x < @hori) && (y >= 0 && y < @verti)
  end
end
