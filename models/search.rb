require_relative( '../db/sql_runner.rb' )
require_relative( 'albums.rb' )
require_relative( 'artists.rb' )
require('pry-byebug')

class Search

  # COMBINE ALBUM AND ARTIST SEARCH AND RETURN ONLY UNIQUE ALBUM
  # ARTIST ITEMS

  def self.new_search(params)
    results_array = []
    artists = Artist.search_artists(params)
    albums = Album.search_albums(params)
    for artist in artists
      results_array = artist.get_albums
    end
    for album in albums
      results_array.push(album)
    end
    results_array.uniq! { |album| album.id}
    return results_array
  end

end
