require './src/reporter'
require './src/interface'
require './src/router'

class Robot < Interface
  attr_accessor :x, :y, :facing, :router

  def initialize(x = 0, y = 0, facing = :north, router = Router)
    @router = router.new x, y, facing
    @facing = @router.facing
    @x = @router.x
    @y = @router.y
    @directions = @router.directions
  end

  def x
    @router.x
  end

  def y
    @router.y
  end

  def facing
    @router.facing
  end

  def do(command, arguments=[])
    send command, *arguments if respond_to? command
  end
end
