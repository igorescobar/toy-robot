class Interface
  def place(x, y, facing, router = self.router)
    router.x = x.to_i
    router.y = y.to_i
    router.facing = facing.downcase.to_sym
  end

  def left(router = self.router)
    router.facing = router.turn_left
  end

  def right(router = self.router)
    router.facing = router.turn_right
  end

  def report(router = self.router, reporter = Reporter)
    reporter.new(router).report
  end

  def move(router = self.router)
    coordenades = router.next_route
    router.x = coordenades[0]
    router.y = coordenades[1]
  end
end
