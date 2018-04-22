require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/albums.rb' )
require_relative( '../models/artists.rb' )

get '/home/artists' do
  @artists = Artist.find_all()
  erb(:"artists/index")
end
