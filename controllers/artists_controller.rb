require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?

require_relative( '../models/albums.rb' )
require_relative( '../models/artists.rb' )

# INDEX
get '/home/artists' do
  @artists = Artist.find_all()
  erb( :'artists/index' )
end

# NEW
get'/home/artists/new' do
  @artists = Artist.show_all()
  erb( :'artists/new' )
end

# SHOW
get '/home/artists/:id' do
@artist = Artist.find_by_id(params[:id])
erb( :'artists/show' )
end
