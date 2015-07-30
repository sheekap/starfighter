class Star

  TITLE_WIDTH = 25
  TITLE_HEIGHT = 25

  attr_accessor :height, :width, :x, :y, :size

  def self.load_animation window
    @animation ||= Gosu::Image::load_tiles(window, "media/star.png",
      TITLE_WIDTH, TITLE_HEIGHT, false)
  end

  def self.load_sound window
    @sound ||= Gosu::Sample.new(window, "media/Beep.wav")
  end

  def initialize window, speed = 0.5
    @window, @speed = window, speed
    @staranim = self.class.load_animation(window)
    @x = rand(window.width - TITLE_WIDTH)
    @y = 0
    @size = rand(3) + 1
    @width = TITLE_WIDTH * @size
    @height = TITLE_HEIGHT * @size
    @beep = self.class.load_sound(window)
    @colour = GameUtilities::random_colour
  end

  def destroy
    @window.play_sound(@beep, 0.5, (1.0 / @size.to_f))
    @window.remove_star(self)
  end

  def draw
    img = @staranim[(Gosu::milliseconds / 100) % @staranim.size]
    img.draw_rot(@x, @y, ZOrder::Star, -90, 0.5, 0.5, @size, @size, @colour)
  end

  def update
    @y += @speed

    if (@y - height) > @window.height
      @window.remove_star(self)
    end
  end

  def radius
    (19.0 * @size) / 2
  end
end
