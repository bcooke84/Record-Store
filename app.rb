require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')
require_relative( './models/albums.rb' )
require_relative( './models/artists.rb' )

get '/home' do
  erb( :home )
end

get '/home/inventory' do
  @artists = Artist.find_all()
  erb ( :inventory )
end
