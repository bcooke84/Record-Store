require( 'pg' )

class SqlRunner

  # def self.run(sql, values = [])
  #   begin
  #     db = PG.connect({ dbname: "record_store", host: "localhost" })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared("query", values)
  #   ensure
  #     db.close()
  #   end
  #   return result
  # end

  def self.run(sql, values = [])
    begin
      db = PG.connect({
        dbname: 'd61vaolq00c5dr',
        host: 'ec2-54-227-247-225.compute-1.amazonaws.com',
        port: '5432',
        user: 'fkmhinjrcvvulq',
        password: '8c38d8595ec4e054eb92e8a7f3afaad2fa6c81fdca36623cb946371f3661c2de'
        })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end

end
