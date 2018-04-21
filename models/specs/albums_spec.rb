require_relative('../../db/sql_runner.rb')
require_relative('../albums.rb')
require_relative('../artists.rb')
require('minitest/autorun')
require('minitest/rg')
require('pry-byebug')

class AlbumTest < MiniTest::Test

def setup()
  @artist1 = Artist.new({
    'name' => 'Arctic Monkeys'
    })
  @artist2 = Artist.new({
    'name' => 'Blur'
    })
  @album1 = Album.new({
    'title' => 'Humbug',
    'stock_level' => 20,
    'artist_id' => @artist1.id
    })
  @album2 = Album.new({
    'title' => 'Suck It and See',
    'stock_level' => 2,
    'artist_id' => @artist1.id
    })
  @album3 = Album.new({
    'title' => 'Modern Life is Rubbish',
    'stock_level' => 10,
    'artist_id' => @artist2.id
    })
  end

  def test_find_all_albums()
    assert_equal(3, Album.find_all().count())
  end

  def test_find_by_id()
    result = Album.find_by_id(2)
    assert_equal(@album2.title, result.first().title())
  end

  def test_stock_level_warning()
    assert_equal("Stock level is LOW", @album2.stock_level_warning())
  end

end
