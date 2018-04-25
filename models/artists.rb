require_relative( '../db/sql_runner.rb' )
require_relative( 'albums.rb' )

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) returning id"
    values = [@name]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.find_all()
    sql = "SELECT * FROM artists ORDER BY name"
    result = SqlRunner.run(sql)
    return Artist.map_artists(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Artist.map_artists(result)[0]
  end

  def get_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1 ORDER BY year;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return Album.map_albums(result)
  end

  def self.map_artists(artist_data)
    return artist_data.map { |artist| Artist.new(artist) }
  end

  def self.check_if_artist_exists(params)
    artists = Artist.find_all()
    for artist in artists
      if artist.name.downcase == params[:artist_id].downcase
        params[:artist_id] = artist.id.to_i
        return true
      end
    end
    return false
  end


  # METHOD BELOW FOR CHECKING IF AN EDITED ARTIST NAME RESULTS IN
  # AN ARTIST WITH NO ASSIGNED ALBUMS

  def self.check_all_artists_have_album()
    artists = Artist.find_all()
    artist_array = []
    for artist in artists
      if artist.get_albums.count == 0
        artist_array.push (artist)
        return artist_array
      end
    end
  end

  # METHOD BELOW FOR DELETING ARTIST OBJECT IF IT HAS
  # NO ASSIGNED ALBUMS

  def self.remove_artists_without_albums()
    result = Artist.check_all_artists_have_album()
    if result.count > 0
      result[0].delete()
    end
  end

  # SEARCH ARTIST NAMES FOR SEARCH STRING

  def self.search_artists(params)
    sql = "SELECT * FROM artists WHERE name LIKE $1;"
    params = "%" + params + "%"
    values = [params]
    results = SqlRunner.run(sql, values)
    return Artist.map_artits(results)
  end


end
