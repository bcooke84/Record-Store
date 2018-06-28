require( 'pg' )

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({ dbname: "record_store", host: "localhost" })
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end

  # def self.run(sql, values = [])
  #   begin
  #     db = PG.connect({
  #       dbname: 'd8a5lrqrjgbfm8',
  #       host: 'ec2-54-243-40-26.compute-1.amazonaws.com',
  #       port: '5432',
  #       user: 'eerekdoqloazya',
  #       password: '85542245dc5dcb566274ab2a90d2c333b83488fe42ae3c64f2ead07d17390901'
  #       })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared("query", values)
  #   ensure
  #     db.close()
  #   end
  #   return result
  # end

end
