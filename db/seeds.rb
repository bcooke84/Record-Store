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
  'name' => 'Idelwild'
  })
artist3 = Artist.new({
  'name' => 'The Strokes'
  })
artist4 = Artist.new({
  'name' => 'Daft Punk'
  })
artist5 = Artist.new({
  'name' => 'Oasis'
  })
artist6 = Artist.new({
  'name' => 'The Notorious B.I.G'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()

album1 = Album.new({
  'title' => 'Humbug',
  'stock_level' => 20,
  'genre' => 'Indie',
  'year' => 2009,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/2/20/Arcticmonkeys-humbug.jpg',
  'cost_price' => 10.00,
  'store_price' => 14.99,
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'Suck It and See',
  'stock_level' => 2,
  'genre' => 'Blues',
  'year' => 2011,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Suckitandsee.jpg',
  'cost_price' => 10.50,
  'store_price' => 15.99,
  'artist_id' => artist1.id
  })
album3 = Album.new({
  'title' => 'The Remote Part',
  'stock_level' => 8,
  'genre' => 'Rock',
  'year' => 2002,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/a/a9/Theremotepart.jpg',
  'cost_price' => 6.67,
  'store_price' => 11.99,
  'artist_id' => artist2.id
  })
album4 = Album.new({
  'title' => 'Whatever People Say I Am, That\'s What I\'m Not',
  'stock_level' => 50,
  'genre' => 'Hip-Hop',
  'year' => 2006,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/5f/Whatever_People_Say_I_Am%2C_That%27s_What_I%27m_Not.jpg',
  'cost_price' => 8.55,
  'store_price' => 13.49,
  'artist_id' => artist1.id
  })
album5 = Album.new({
  'title' => 'AM',
  'stock_level' => 25,
  'genre' => 'Indie',
  'year' => 2013,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/0/04/Arctic_Monkeys_-_AM.png',
  'cost_price' => 8.13,
  'store_price' => 13.99,
  'artist_id' => artist1.id
  })
album6 = Album.new({
  'title' => 'Is This It',
  'stock_level' => 14,
  'genre' => 'Indie',
  'year' => 2001,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/0/09/The_Strokes_-_Is_This_It_cover.png',
  'cost_price' => 8.12,
  'store_price' => 12.49,
  'artist_id' => artist3.id
  })
album7 = Album.new({
  'title' => 'Discovery',
  'stock_level' => 17,
  'genre' => 'Dance',
  'year' => 2001,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/a/ae/Daft_Punk_-_Discovery.jpg',
  'cost_price' => 8.97,
  'store_price' => 12.99,
  'artist_id' => artist4.id
  })
album8 = Album.new({
  'title' => 'Definitely Maybe',
  'stock_level' => 10,
  'genre' => 'Britpop',
  'year' => 1995,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/d/d4/OasisDefinitelyMaybealbumcover.jpg',
  'cost_price' => 7.63,
  'store_price' => 11.99,
  'artist_id' => artist5.id
  })
album9 = Album.new({
  'title' => 'Ready To Die',
  'stock_level' => 7,
  'genre' => 'Hip-Hop',
  'year' => 1994,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/9/97/Ready_To_Die.jpg',
  'cost_price' => 4,
  'store_price' => 9.99,
  'artist_id' => artist6.id
  })
album10 = Album.new({
  'title' => 'Life After Death',
  'stock_level' => 10,
  'genre' => 'Hip-Hop',
  'year' => 1997,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/1/1c/NotoriousB.I.G.LifeAfterDeath.jpg',
  'cost_price' => 8.00,
  'store_price' => 12.49,
  'artist_id' => artist6.id
  })

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()
album8.save()
album9.save()
album10.save()

binding.pry
nil
