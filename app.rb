require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')
require_relative( './models/albums.rb' )
require_relative( './models/artists.rb' )
require_relative( './models/search.rb' )

  get '/home/inventory' do
    @artists = Artist.find_all()
    erb ( :inventory )
  end

  get '/home/inventory/by-artist-asc' do
    @artists = Artist.find_all()
    erb ( :'inventory/by_artist_asc' )
  end

  get '/home/inventory/by-artist-desc' do
    @artists = Artist.find_all_desc()
    erb ( :'inventory/by_artist_desc' )
  end

  get '/home/inventory/by-album-asc' do
    erb ( :'inventory/by_album_asc' )
  end

  get '/home/inventory/by-album-desc' do
    erb ( :'inventory/by_album_desc' )
  end

  get '/home/inventory/by-genre-asc' do
    erb ( :'inventory/by_genre_asc' )
  end

  get '/home/inventory/by-genre-desc' do
    erb ( :'inventory/by_genre_desc' )
  end

  get '/home/inventory/by-release-year-asc' do
    erb ( :'inventory/by_release_year_asc' )
  end

  get '/home/inventory/by-release-year-desc' do
    erb ( :'inventory/by_release_year_desc' )
  end

  get '/home/inventory/by-cost-price-asc' do
    erb ( :'inventory/by_cost_price_asc' )
  end

  get '/home/inventory/by-cost-price-desc' do
    erb ( :'inventory/by_cost_price_desc' )
  end

  get '/home/inventory/by-store-price-asc' do
    erb ( :'inventory/by_store_price_asc' )
  end

  get '/home/inventory/by-store-price-desc' do
    erb ( :'inventory/by_store_price_desc' )
  end

  get '/home/inventory/by-stock-level-asc' do
    erb ( :'inventory/by_stock_level_asc' )
  end

  get '/home/inventory/by-stock-level-desc' do
    erb ( :'inventory/by_stock_level_desc' )
  end

  get '/home/search-result/results' do
    search_results = params[:search_bar]
    @search_results = Search.new_search(search_results.downcase)
    erb ( :search_results )
  end
