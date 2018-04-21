require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Album

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @stock_level = options['stock_level'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def self.show_all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return Album.map_albums(sql)
  end

  def self.delete_all()
    sql = "DELETE from albums"
    SqlRunner.run(sql)
  end


  def self.map_albums(albums_data)
    return albums_data.map { |album| Album.new(album) }
  end

end
