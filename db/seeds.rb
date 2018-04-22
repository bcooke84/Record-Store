require_relative( 'sql_runner.rb' )
require_relative( '../models/albums.rb' )
require_relative( '../models/artists.rb' )

require ( 'pry-byebug' )

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Arctic Monkeys'
  })
artist2 = Artist.new({
  'name' => 'Blur'
  })

artist1.save()
artist2.save()


album1 = Album.new({
  'title' => 'Humbug',
  'stock_level' => 20,
  'genre' => 'Indie',
  'year' => 2009,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/2/20/Arcticmonkeys-humbug.jpg',
  'cost_price' => 10,
  'store_price' => 14,
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'Suck It and See',
  'stock_level' => 2,
  'genre' => 'Indie',
  'year' => 2011,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Suckitandsee.jpg',
  'cost_price' => 10,
  'store_price' => 15,
  'artist_id' => artist1.id
  })
album3 = Album.new({
  'title' => 'Modern Life is Rubbish',
  'stock_level' => 10,
  'genre' => 'Indie',
  'year' => 1993,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/1/15/Blur_-_Modern_Life_is_Rubbish.jpg',
  'cost_price' => 9,
  'store_price' => 13,
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()

binding.pry
nil
