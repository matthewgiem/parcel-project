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
    price = ""
    if @length * @width * @height > 200 && @unit == true || @length/2.54 * @width/2.54 * @height/2.54 > 200 && @unit == false
      price = "your package is too large to ship"
    elsif
      price = ((@weight/2.00) * (@distance + @speed + self.volume()))
      price = '%.2f'%price
    end
    price
  end
end
