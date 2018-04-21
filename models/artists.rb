require_relative('../db/sql_runner.rb')
require_relative('albums.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def self.show_all()
    sql = "SELECT * FROM artists;"
    result = SqlRunner.run(sql)
    return Artist.map_artists(result)
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def self.map_artists(artist_data)
    return artist_data.map { |artist| Artist.new(artist) }
  end

end
