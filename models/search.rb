require_relative( '../db/sql_runner.rb' )
require_relative( 'albums.rb' )
require_relative( 'artists.rb' )
require('pry-byebug')

class Search

  # COMBINE ALBUM AND ARTIST SEARCH AND RETURN ONLY UNIQUE ALBUM
  # ARTIST ITEMS

  def self.new_search(params)
    artist_array = []
    album_array = []
    results_array = []
    artists = Artist.search_artists(params)
    albums = Album.search_albums(params)
    for artist in artists
      artist_array +=artist.get_albums
    end
    for album in albums
      album_array.push(album)
    end
    results_array = (artist_array + album_array).uniq { |album| album.id}
    results_array.sort_by! { |album| album.get_artist.name.downcase }
    return results_array
  end

end
