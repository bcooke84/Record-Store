require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Album

  attr_reader :id
  attr_accessor :title, :stock_level, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock_level = options['stock_level'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, stock_level, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @stock_level, @artist_id]
    result = SqlRunner.run(sql, values)[0]
    @id = result['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (title, stock_level, artist_id) = ($1, $2, $3) WHERE id = $4;"
    values = [@title, @stock_level, @artist_id, @id]
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
    sql = "SELECT * FROM albums;"
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
      return "Stock level is LOW"
    elsif @stock_level > 30
      return "Stock level is HIGH"
    else return "Stock level is MEDIUM"
    end
  end

  def self.map_albums(albums_data)
    return albums_data.map { |album| Album.new(album) }
  end

end
