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

# IF THE ARTIST NAME MATCHES EXISTING ARTIST, CREATE A NEW ALBUM WITH THE album.artist_id() SET AS THE EXISTING ARTISTS ID.
# IF THE ARTISTS NAME DOES NOT MATCH ANY OF THE EXISTING ARTISTS NAME, CREATE A NEW ARTIST WITH THIS NAME AND THEN CREATE A NEW ALBUM WITH THE album.artist_id() SET AS THE NEW ARTISTS ID.

# CREATE
post '/home/albums' do
  @artists = Artist.find_all()
  Album.new_album_from_form(params)
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
  @album = Album.edit_album_from_form(params)
  @album.update()
  redirect to '/home/inventory'
end

# DESTROY
post "/home/albums/:id/delete" do
  @album = Album.find_by_id(params[:id])
  @album.delete()
  redirect to '/home/inventory'
end
