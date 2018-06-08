require_relative( '../../db/sql_runner.rb' )
require_relative( '../albums.rb' )
require_relative( '../artists.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )

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
    'genre' => 'Indie',
    'year' => 2009,
    'artwork' => 'https://upload.wikimedia.org/wikipedia/en/2/20/Arcticmonkeys-humbug.jpg',
    'cost_price' => 10.00,
    'store_price' => 14.99,
    'artist_id' => @artist1.id
    })
  @album2 = Album.new({
    'title' => 'Suck It and See',
    'stock_level' => 2,
    'genre' => 'Blues',
    'year' => 2011,
    'artwork' => 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Suckitandsee.jpg',
    'cost_price' => 10.50,
    'store_price' => 15.99,
    'artist_id' => @artist1.id
    })
  @album3 = Album.new({
    'title' => 'Modern Life is Rubbish',
    'stock_level' => 10,
    'genre' => 'Indie',
    'year' => 1993,
    'artwork' => 'https://upload.wikimedia.org/wikipedia/en/1/15/Blur_-_Modern_Life_is_Rubbish.jpg',
    'cost_price' => 8.55,
    'store_price' => 13.49,
    'artist_id' => @artist2.id
    })
  end

  def test_find_all_albums()
    assert_equal(5, Album.find_all().count())
  end

  # def test_find_by_id()
  #   result = Album.find_by_id(2)
  #   assert_equal('@album2.title', result.first().title())
  # end

  def test_stock_level_warning()
    assert_equal("LOW", @album2.stock_level_warning())
  end

  def test_total_album_stock_level()
    assert_equal(107, Album.total_album_stock_level())
  end

  def test_total_album_cost_price()
    assert_equal(937.25, Album.total_album_cost_price())
  end

  def test_total_album_store_price()
    assert_equal(1490.93, Album.total_album_store_price())
  end

end
