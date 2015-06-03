class Reporter
  attr_reader :router
  def initialize(router)
    @router = router
  end

  def report
    puts [@router.x, @router.y, @router.facing.to_s.upcase].join(',')
  end
end
