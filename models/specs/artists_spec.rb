require_relative( '../../db/sql_runner.rb' ) 
require_relative( '../albums.rb' )
require_relative( '../artists.rb' )
require( 'minitest/autorun' )
require( 'minitest/rg' )
require( 'pry-byebug' )

class ArtistTest < MiniTest::Test

def setup
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

  def test_find_all_artists()
    assert_equal(2, Artist.find_all().count)
  end

  def test_find_by_id()
    result = Artist.find_by_id(1)
    assert_equal(@artist1.name, result.first.name)
  end

end
