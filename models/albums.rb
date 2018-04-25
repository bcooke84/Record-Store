require_relative( '../db/sql_runner.rb' )
require_relative( 'artists.rb' )

require('pry-byebug')

class Album

  attr_reader :id
  attr_accessor :title, :stock_level, :genre, :year, :artwork, :cost_price, :store_price, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock_level = options['stock_level'].to_i
    @genre = options['genre']
    @year = options['year'].to_i
    @artwork = options['artwork']
    @cost_price = options['cost_price'].to_f
    @store_price = options['store_price'].to_f
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, stock_level, genre, year, artwork, cost_price, store_price, artist_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id;"
    values = [@title, @stock_level, @genre, @year, @artwork, @cost_price, @store_price, @artist_id]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, stock_level, genre, year, artwork, cost_price, store_price, artist_id) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9;"
    values = [@title, @stock_level, @genre, @year, @artwork, @cost_price, @store_price, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE from albums;"
    SqlRunner.run(sql)
  end

  def self.find_all()
    sql = "SELECT * FROM albums ORDER BY title"
    result = SqlRunner.run(sql)
    return Album.map_albums(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * from albums WHERE id = $1;"
    values = [id]
    array = SqlRunner.run(sql, values)[0]
    return Album.new(array)
  end

  def stock_level_warning()
    if @stock_level < 5
      return "LOW"
    elsif @stock_level > 15
      return "HIGH"
    else return "MEDIUM"
    end
  end

  def get_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.map_artists(result).first()
  end


  def self.map_albums(albums_data)
    return albums_data.map { |album| Album.new(album) }
  end

  # SORTED SQL QUERIES FOR SORT FUNTION ON INVENTORY TABLE

  def self.get_albums_by_album()
    sql = "SELECT * FROM albums ORDER BY title;"
    result = SqlRunner.run(sql)
    return Album.map_albums(result)
  end

  def self.get_albums_by_stock_level()
    sql = "SELECT * FROM albums ORDER BY stock_level;"
    result = SqlRunner.run(sql)
    return Album.map_albums(result)
  end

  def self.get_albums_by_genre(genre)
    sql = "SELECT * FROM albums WHERE genre = $1;"
    values = [genre]
    result = SqlRunner.run(sql, values)
    return Album.map_albums(result)
  end

# RETURNS ONLY THE UNIQUE GENRES FROM DATABASE SO THAT THE GENRE FORM FIELD
# DOES NOT INCLUDE DUPLICATES

  def self.find_unique_genres()
    sql = "SELECT DISTINCT genre FROM albums ORDER BY genre;"
    result = SqlRunner.run(sql)
    return result
  end

# DETERMINE THE STOCK LEVEL FOR CSS COLOURING ON INVENTORY PAGE IN WEB APP

  def self.total_album_stock_level()
    albums = self.find_all()
    total = 0
    albums.each { |album| total += album.stock_level }
    return total
  end

  def self.total_album_cost_price()
    albums = self.find_all()
    total = 0
    albums.each { |album| total += (album.stock_level * album.cost_price) }
    return total.round(2)
  end

  def self.total_album_store_price()
    albums = self.find_all()
    total = 0
    albums.each { |album| total += (album.stock_level * album.store_price) }
    return total.round(2)
  end

  # CREATES A NEW ALBUM OBJECT IF ARTIST ALREADY EXITSTS
  # CREATES A NEW ARTIST OBJECT PRIOR TO THE ALBUM OBJECT IF ITS A NEW ARTIST

  def self.new_album_from_form(params)
    if Artist.check_if_artist_exists(params) == true
      new_album = Album.new(params)
      new_album.save()
    elsif Artist.check_if_artist_exists(params) == false
      new_artist = Artist.new({ 'name' => params[:artist_id] })
      new_artist.save()
      params[:artist_id] = new_artist.id.to_i
      new_album = Album.new(params)
      new_album.save()
    end
  end

  # CREATES A NEW ALBUM OBJECT TO BE UPDATED IF ALBUM DETAILS ARE EDITED
  # CREATES A NEW ARTIST OBJECT PRIOR TO THE ALBUM OBJECT IF ITS A NEW ARTIST

  def self.edit_album_from_form(params)
    if Artist.check_if_artist_exists(params) == true
      new_album = Album.new(params)
      return new_album
    elsif Artist.check_if_artist_exists(params) == false
      new_artist = Artist.new({ 'name' => params[:artist_id] })
      new_artist.save()
      params[:artist_id] = new_artist.id.to_i
      new_album = Album.new(params)
      return new_album
    end
  end

  # SEARCH ALBUMS TITLES FOR SEARCH STRING

    def self.search_albums(params)
      sql = "SELECT * FROM albums WHERE title LIKE $1;"
      params = "%" + params + "%"
      values = [params]
      results = SqlRunner.run(sql, values)
      return Album.map_albums(results)
    end


end
