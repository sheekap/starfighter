module GameUtilities
  def self.random_colour base_brightness = 40
    colour = Gosu::Color.new(0xff000000)
    colour.red = rand(255 - base_brightness) + base_brightness
    colour.green = rand(255 - base_brightness) + base_brightness
    colour.blue = rand(255 - base_brightness) + base_brightness
    colour
  end

  def self.collide? obj1, obj2
    dist = Gosu::distance(obj1.x, obj1.y, obj2.x, obj2.y)
    dist < (obj1.radius + obj2.radius)
  end
end
