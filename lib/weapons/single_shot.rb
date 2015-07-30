class SingleShot < BaseShot

  # collision with an obstacle destroys this shot
  def collide? obj
    if super
      @ship.remove_shot(self)
      true
    end
  end
end
