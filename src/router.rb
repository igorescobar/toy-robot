class Router
  attr_accessor :x, :y, :facing

  @@x_range = (0..4)
  @@y_range = (0..4)
  @@route_directions = {
    north:  { x: 0   ,   y: 1  },
    south:  { x: 0   ,   y: -1 },
    west:   { x: -1  ,   y: 0  },
    east:   { x: 1   ,   y: 0  }
  }

  def initialize(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end

  def directions
    [:north, :east, :south, :west]
  end

  def x=(x)
    @x = valid_range!(x, @@x_range)
  end

  def y=(y)
    @y = valid_range!(y, @@y_range)
  end

  def facing=(facing)
    @facing = facing if directions.include? facing
  end

  def next_route
    next_x = @x + @@route_directions[@facing][:x]
    next_y = @y + @@route_directions[@facing][:y]

    [valid_range!(next_x, @@x_range), valid_range!(next_y, @@y_range)]
  end

  def turn_left
    index = directions.index @facing
    directions[index - 1] || directions.last
  end

  def turn_right
    index = directions.index @facing
    directions[index + 1] || directions.first
  end

  private

  def valid_range!(n, range)
    n = range.last if n > range.last
    n = range.first if n < range.first
    n
  end
end
