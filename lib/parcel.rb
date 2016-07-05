require('pry')

class Parcel
  define_method(:initialize) do |length, width, height, weight, distance, speed, unit|
    @length = length
    @width = width
    @height = height
    @weight = weight
    @distance = distance
    @speed = speed
    @unit = unit
  end

  define_method(:volume) do
    volume = 0
    if @unit == false
      volume = @length/2.54 * @width/2.54 * @height/2.54
    else
      volume = @length * @width * @height
    end
    price = 20
    if volume < 30
      price = 5
    end
    if volume >= 30 && volume < 100
      price = 10
    end
    price
  end

  define_method(:cost_to_ship) do
    price = 0
    if @length.to_f * @width.to_f * @height.to_f > 200 && @unit == true || @length.to_f/2.54 * @width.to_f/2.54 * @height.to_f/2.54 > 200 && @unit == false
      price = "your package is too large to ship"
    elsif
      price = ((@weight.to_f/2.00) * (@distance.to_f + @speed.to_f + self.volume()))
      price = '%.2f'%price
    end
    price
  end
end
