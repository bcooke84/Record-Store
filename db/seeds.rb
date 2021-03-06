require_relative( 'sql_runner.rb' )
require_relative( '../models/albums.rb' )
require_relative( '../models/artists.rb' )

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Arctic Monkeys'
  })
artist2 = Artist.new({
  'name' => 'Idlewild'
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
artist7 = Artist.new({
  'name' => 'Underworld'
  })
artist8 = Artist.new({
  'name' => 'Run The Jewels'
  })
artist9 = Artist.new({
  'name' => 'Niteworks'
  })
artist10 = Artist.new({
  'name' => 'DJ Jazzy Jeff & The Fresh Prince'
  })
artist11 = Artist.new({
  'name' => 'The Jackson 5'
  })
artist12 = Artist.new({
  'name' => 'The Beach Boys'
  })
artist13 = Artist.new({
  'name' => 'Ice Cube'
  })
artist14 = Artist.new({
  'name' => 'A Tribe Called Quest'
  })

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()
artist6.save()
artist7.save()
artist8.save()
artist9.save()
artist10.save()
artist11.save()
artist12.save()
artist13.save()
artist14.save()

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
  'genre' => 'Indie',
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
  'stock_level' => 8,
  'genre' => 'Indie',
  'year' => 2006,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/5f/Whatever_People_Say_I_Am%2C_That%27s_What_I%27m_Not.jpg',
  'cost_price' => 8.55,
  'store_price' => 13.49,
  'artist_id' => artist1.id
  })
album5 = Album.new({
  'title' => 'AM',
  'stock_level' => 11,
  'genre' => 'Indie',
  'year' => 2013,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/0/04/Arctic_Monkeys_-_AM.png',
  'cost_price' => 8.13,
  'store_price' => 13.99,
  'artist_id' => artist1.id
  })
album6 = Album.new({
  'title' => 'Is This It',
  'stock_level' => 4,
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
  'genre' => 'Electronic',
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
  'stock_level' => 4,
  'genre' => 'Hip-Hop',
  'year' => 1997,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/1/1c/NotoriousB.I.G.LifeAfterDeath.jpg',
  'cost_price' => 8.00,
  'store_price' => 12.49,
  'artist_id' => artist6.id
  })
album11 = Album.new({
  'title' => 'Favourite Worst Nightmare',
  'stock_level' => 9,
  'genre' => 'Indie',
  'year' => 2007,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/a/ae/Favourite_Worst_Nightmare.jpg',
  'cost_price' => 8.00,
  'store_price' => 11.99,
  'artist_id' => artist1.id
  })
album12 = Album.new({
  'title' => 'dubnobasswithmyheadman',
  'stock_level' => 5,
  'genre' => 'Electronic',
  'year' => 1994,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/b/b4/Underworld.dubnobasswithmyheadman.jpg',
  'cost_price' => 7.60,
  'store_price' => 11.99,
  'artist_id' => artist7.id
  })
album13 = Album.new({
  'title' => 'Run The Jewels 3',
  'stock_level' => 11,
  'genre' => 'Hip-Hop',
  'year' => 2016,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/9/96/RunTheJewels3.jpg',
  'cost_price' => 7.65,
  'store_price' => 11.49,
  'artist_id' => artist8.id
  })
album14 = Album.new({
  'title' => 'NW',
  'stock_level' => 9,
  'genre' => 'Electronic',
  'year' => 2015,
  'artwork' => 'https://f4.bcbits.com/img/a0322225427_10.jpg',
  'cost_price' => 6.65,
  'store_price' => 10.99,
  'artist_id' => artist9.id
  })
album15 = Album.new({
  'title' => 'Homebase',
  'stock_level' => 7,
  'genre' => 'Hip-Hop',
  'year' => 1991,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/55/Homebase_%28DJ_Jazzy_Jeff_%26_The_Fresh_Prince_album_-_cover_art%29.jpg',
  'cost_price' => 5.50,
  'store_price' => 13.99,
  'artist_id' => artist10.id
  })
album16 = Album.new({
  'title' => 'Diana Ross Presents The Jackson 5',
  'stock_level' => 3,
  'genre' => 'Pop',
  'year' => 1969,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/9/9c/Ross-presents-jackson-5-350.jpg',
  'cost_price' => 9.00,
  'store_price' => 16.99,
  'artist_id' => artist11.id
  })
album17 = Album.new({
  'title' => 'Smiley Smile',
  'stock_level' => 1,
  'genre' => 'Pop',
  'year' => 1967,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/2/21/SmileySmileCover.jpg',
  'cost_price' => 8.70,
  'store_price' => 15.99,
  'artist_id' => artist12.id
  })
album18 = Album.new({
  'title' => 'The Predator',
  'stock_level' => 3,
  'genre' => 'Hip-Hop',
  'year' => 1992,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/8/8e/Ice_Cube_-_The_Predator_-_Album_Cover.jpg',
  'cost_price' => 7.65,
  'store_price' => 11.99,
  'artist_id' => artist13.id
  })
album19 = Album.new({
  'title' => 'People''s Instinctive Travels and the Paths of Rhythm',
  'stock_level' => 11,
  'genre' => 'Hip-Hop',
  'year' => 1990,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/f/f3/ATCQPeople%27sInstinctTravels.jpg',
  'cost_price' => 6.98,
  'store_price' => 12.99,
  'artist_id' => artist14.id
  })
album20 = Album.new({
  'title' => 'Pet Sounds',
  'stock_level' => 3,
  'genre' => 'Pop',
  'year' => 1966,
  'artwork' => 'https://upload.wikimedia.org/wikipedia/en/b/bb/PetSoundsCover.jpg',
  'cost_price' => 6.51,
  'store_price' => 11.99,
  'artist_id' => artist12.id
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
album11.save()
album12.save()
album13.save()
album14.save()
album15.save()
album16.save()
album17.save()
album18.save()
album19.save()
album20.save()

# binding.pry
# nil
