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
  boolean = true
  for artist in @artists
    if artist.name == params[:artist_id]
      params[:artist_id] = artist.id.to_i
      new_album = Album.new(params)
      new_album.save()
      boolean = true
      redirect to '/home/albums'
    elsif artist.name != params[:artist_id]
      boolean = false
    end
  end
  if boolean == false
    new_artist = Artist.new({
      'name' => params[:artist_id]
      })
      new_artist.save()
      params[:artist_id] = new_artist.id.to_i
      new_album = Album.new(params)
      new_album.save()
      boolean = true
      redirect to '/home/albums'
    end
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
  redirect to '/home/inventory'
end
