require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/result') do
  @ = params.fetch("")
  @ = params.fetch("")
  erb(:result)
end
