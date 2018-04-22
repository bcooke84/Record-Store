require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/artists.rb' )
require_relative( '../models/albums.rb' )

get '/home/albums' do
  @albums = Album.find_all()
  erb(:"albums/index")
end
