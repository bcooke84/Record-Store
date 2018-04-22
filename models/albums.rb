require_relative( '../db/sql_runner.rb' )
require_relative( 'artists.rb' )

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
    @cost_price = options['cost_price'].to_i
    @store_price = options['store_price'].to_i
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
    sql = "SELECT * FROM albums ORDER BY title;"
    result = SqlRunner.run(sql)
    return Album.map_albums(result)
  end

  def self.find_by_id(id)
    sql = "SELECT * from albums WHERE id = $1;"
    values = [id]
    array = SqlRunner.run(sql, values)
    return Album.map_albums(array)
  end

  def stock_level_warning()
    if @stock_level < 10
      return "LOW"
    elsif @stock_level > 30
      return "HIGH"
    else return "MEDIUM"
    end
  end

  def get_artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return Artist.map_artists(result).first()
  end

  def self.map_albums(albums_data)
    return albums_data.map { |album| Album.new(album) }
  end

end
