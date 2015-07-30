class DoubleShot < BaseShot
  def initialize window, ship, x, y
    super

    c1 = 0xff008800
    c2 = 0xff22aa22

    s1 = SingleShot.new(window, self, x - 15, y, c1, c2)
    s2 = SingleShot.new(window, self, x + 15, y, c1, c2)
    @shots = [s1, s2]

    @sound_freq = 0.15
    @sound_vol = 1.0
  end

  def draw
    @shots.each { |s| s.draw }
  end

  def update
    @shots.each { |s| s.update }
  end

  def collide? obj
    @shots.any? { |s| s.collide?(obj) }
  end

  def remove_shot shot
    @shots.delete(shot)
    if @shots.empty?
      @ship.remove_shot(self)
    end
  end
end
