require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')
require_relative( './models/albums.rb' )
require_relative( './models/artists.rb' )

get '/home/inventory' do
  @artists = Artist.find_all()
  erb ( :inventory )
end

get '/home/inventory/by-album' do
  erb ( :by_album )
end

get '/home/inventory/by-stock-level' do
  erb ( :by_stock_level )
end

get '/home/search-result/artists' do
  search_artists = params[:search_artists]
  @artists = Artist.search_artists(search_artists)
  erb ( :search_results_artists )
end

get '/home/search-result/albums' do
  search_albums = params[:search_albums]
  @albums = Album.search_albums(search_albums)
  erb ( :search_results_albums )
end
