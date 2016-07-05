require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/result') do
  @length = params.fetch("length").to_i
  @width = params.fetch("width").to_i
  @height = params.fetch("height").to_i
  @weight = params.fetch("weight").to_i
  @distance = params.fetch("distance")
  @speed = params.fetch("speed")
  @unit = params.fetch("unit")
  package = Parcel.new(@length, @width, @height, @weight, @distance, @speed, @unit)
  @price = package.cost_to_ship()
  erb(:result)
end
