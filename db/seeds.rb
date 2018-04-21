require_relative('sql_runner.rb')
require_relative('../models/albums.rb')
require_relative('../models/artists.rb')

require ('pry-byebug')

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
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'Suck It and See',
  'stock_level' => 2,
  'artist_id' => artist1.id
  })
album3 = Album.new({
  'title' => 'Modern Life is Rubbish',
  'stock_level' => 10,
  'artist_id' => artist2.id
  })

album1.save()
album2.save()
album3.save()

binding.pry
nil
