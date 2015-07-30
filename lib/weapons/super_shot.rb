class SuperShot < BaseShot
  def initialize window, player, x, y
    super
    @colour1 = Gosu::Color.new(0xffaa0000)
    @colour2 = Gosu::Color.new(0xffaacc00)
    @width = 4
    @speed = 5.5
    @sound_freq = 0.3
    @sound_vol = 0.5
  end
end
