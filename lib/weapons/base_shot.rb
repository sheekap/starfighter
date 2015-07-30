class BaseShot

  attr_accessor :x, :y, :width, :height, :colour1, :colour2, :speed

  def self.load_sound window
    @fire_sound ||= Gosu::Sample.new(window, "media/fire.ogg")
  end

  def initialize window, ship, x, y, colour1 = 0xffd936f1, colour2 = 0xff000000
    @window, @ship, @x, @y = window, ship, x, y
    @width = 2 # this is actually 1/2 of width
    @height = 20
    @speed = 10.0
    @sound_freq = 0.15
    @sound_vol = 2.0
    @colour1 = Gosu::Color.new(colour1)
    @colour2 = Gosu::Color.new(colour2)
    @sound = self.class.load_sound(@window)
    @muted = false
  end

  def update
    @y -= @speed

    if(@x > @window.width || @y > @window.height || @x < 0.0 || @y < 0.0)
      @ship.remove_shot(self)
    end
  end

  def draw
    @window.draw_quad(x - width, y, colour1,
      x + width, y, colour1,
      x - width, y + height, colour2,
      x + width, y + height, colour2,
      ZOrder::Shot)
  end

  def fire
    play_sound
  end

  def play_sound
    @window.play_sound(@sound, @sound_freq, @sound_vol)
  end

  def collide? obj
    if (Gosu::distance(@x - @width, @y, obj.x, obj.y) < obj.radius) ||
      (Gosu::distance(@x + @width, @y, obj.x, obj.y) < obj.radius)
      true
    else
      false
    end
  end
end
