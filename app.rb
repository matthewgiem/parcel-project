require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/result') do
  @length = params.fetch("length").to_f
  @width = params.fetch("width").to_f
  @height = params.fetch("height").to_f
  @weight = params.fetch("weight").to_f
  @distance = params.fetch("distance").to_i
  @speed = params.fetch("speed").to_i
  @unit = params.fetch("unit")
  package = Parcel.new(@length, @width, @height, @weight, @distance, @speed, @unit)
  @price = package.cost_to_ship()
  erb(:result)
end
