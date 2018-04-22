require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( '../models/artists.rb' )
require_relative( '../models/albums.rb' )

# INDEX
get '/home/albums' do
  @albums = Album.find_all()
  erb(:"albums/index")
end

# NEW
get'/home/albums/new' do
  @albums = Album.find_all()
  @artists = Artist.find_all()
  @genres = Album.find_unique_genres()
  erb(:'albums/new')
end

# SHOW
get '/home/albums/:id' do
@album = Album.find_by_id(params[:id])
erb(:'albums/show')
end

# CREATE
post '/home/albums' do
  new_album = Album.new(params)
  new_album.save()
  redirect to '/home/albums'
end

# EDIT
get "/home/albums/:id/edit" do
  @album = Album.find_by_id(params[:id])
  @artists = Artist.find_all()
  @genres = Album.find_unique_genres()
  erb(:'albums/edit')
end

# UPDATE
post "/home/albums/:id" do
  @album = Album.new(params)
  @album.update()
  redirect to '/home/albums'
end

# DESTROY
post "/home/albums/:id/delete" do
  @album = Album.find_by_id(params[:id])
  @album.delete()
  redirect to '/home/albums'
end
